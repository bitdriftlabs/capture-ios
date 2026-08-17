#!/usr/bin/env python3

import argparse
import json
import os
import re
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path

REPOSITORY = "bitdriftlabs/capture-sdk"
CATEGORIES = ("Added", "Changed", "Fixed")
CATEGORY_HEADER = re.compile(r"^\*\*\s*(Added|Changed|Fixed)\s*\*\*\s*$")


def fetch_release_body(version: str) -> str:
    """Gets the capture-sdk release notes for a specific version"""
    tag = f"v{version.removeprefix('v')}"
    url = f"https://api.github.com/repos/{REPOSITORY}/releases/tags/{urllib.parse.quote(tag)}"
    headers = {"Accept": "application/vnd.github+json"}
    if token := os.environ.get("GH_TOKEN"):
        headers["Authorization"] = f"Bearer {token}"

    try:
        with urllib.request.urlopen(
            urllib.request.Request(url, headers=headers)
        ) as response:
            return json.load(response)["body"]
    except urllib.error.HTTPError as error:
        raise RuntimeError(
            f"Could not fetch Capture SDK release {tag}: {error}"
        ) from error


def extract_items(release_body: str, section: str, category: str) -> list[str]:
    """Extract the category's bullets from one platform section.

    The release in capture-sdk is organized as platform headings followed by
    category headings. This method extracts the contentt from the bullets included
    in each category inside each section.
    """
    current_section = ""
    current_category = ""
    items = []
    blank_lines = []

    for line in release_body.splitlines():
        if line.startswith("### "):
            # A new platform section also ends the preceding category
            current_section = line.removeprefix("### ").strip()
            current_category = ""
            blank_lines = []
        elif match := CATEGORY_HEADER.fullmatch(line):
            # This accepts headings in case there's a formatting failure
            current_category = match.group(1)
            blank_lines = []
        elif (
            current_section == section
            and current_category == category
            and line.startswith("- ")
        ):
            items.append(line)
            blank_lines = []
        elif current_section == section and current_category == category and not line:
            blank_lines.append(line)
        elif (
            current_section == section
            and current_category == category
            and items
            and line[:1].isspace()
        ):
            # Markdown treats indented text as a continuation of the last item
            items[-1] += "\n" + "\n".join(blank_lines + [line])
            blank_lines = []
        else:
            blank_lines = []

    return items


def generate_notes(release_body: str) -> str:
    """Render iOS and shared release notes, or the no-changes fallback"""
    if not any(line.startswith("### ") for line in release_body.splitlines()):
        raise RuntimeError(
            "Capture SDK release notes do not contain any platform sections."
        )

    rendered_categories = []
    for category in CATEGORIES:
        items = extract_items(release_body, "iOS", category)
        items.extend(extract_items(release_body, "Both", category))
        if items:
            rendered_categories.append(f"**{category}**\n\n" + "\n".join(items))

    if not rendered_categories:
        return "No customer-facing changes in this Capture iOS release.\n"

    return "\n\n".join(rendered_categories) + "\n"


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "version", help="Capture SDK version, with or without a v prefix"
    )
    parser.add_argument("output_file", type=Path)
    arguments = parser.parse_args()

    arguments.output_file.write_text(
        generate_notes(fetch_release_body(arguments.version))
    )


if __name__ == "__main__":
    main()

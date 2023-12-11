Pod::Spec.new do |s|
  s.name = 'BitdriftCapture'
  s.version = '0.9.99'
  s.author = 'bitdrift'
  s.summary = "A dynamic observability SDK for mobile developers."
  s.homepage = 'https://bitdrift.io'
  s.documentation_url = 'https://docs.bitdrift.io'
  s.module_name = 'Capture'
  s.social_media_url = 'https://twitter.com/bitdriftio'
  s.license = { 
    :type => "BITDRIFT SOFTWARE DEVELOPMENT KIT LICENSE AGREEMENT",
    :text => <<-LICENSE
    BITDRIFT SOFTWARE DEVELOPMENT KIT LICENSE AGREEMENT
    
    PLEASE READ THESE TERMS AND CONDITIONS CAREFULLY BEFORE USING THE SOFTWARE OFFERED BY BITDRIFT, INC. (“BITDRIFT” OR “COMPANY”). BY DOWNLOADING, INSTALLING AND/OR USING THE SOFTWARE YOU AGREE TO THE TERMS AND CONDITIONS OF THIS SOFTWARE DEVELOPMENT KIT LICENSE AGREEMENT (THE “AGREEMENT”), AND YOU (“YOU” OR “CUSTOMER”) AGREE THAT YOU ARE BOUND BY THESE TERMS AND ARE A PARTY TO THIS AGREEMENT.  YOUR USE OF THE SOFTWARE IS EXPRESSLY CONDITIONED ON YOUR ACCEPTANCE OF THE TERMS AND CONDITIONS OF THIS AGREEMENT.  IF YOU DO NOT AGREE TO ALL OF THE FOLLOWING, YOU MAY NOT USE OR ACCESS THE SOFTWARE IN ANY MANNER.  IF THE TERMS OF THIS AGREEMENT ARE CONSIDERED AN OFFER, ACCEPTANCE IS EXPRESSLY LIMITED TO SUCH TERMS.

    1. Scope of This Agreement.  This Agreement applies to the Software and Documentation made available by bitdrift hereunder to you.  “Software” means the bitdrift software development kit software made available in connection with this Agreement, and any copies made by or on your behalf, and any updates, upgrades or other new features, functionality or enhancements to the Software made available to you by bitdrift.  "Documentation" means any on-line read me, help files, or other related explanatory materials with respect to the Software.        

    2. License.  Subject to the terms and conditions of this Agreement, bitdrift hereby grants to Customer, and Customer hereby accepts from bitdrift, a limited, non-exclusive, non-transferable, non-assignable and non-sublicenseable license to: (a) run the Software solely to  interact or communicate with the Service; and (b) distribute the Software solely as incorporated in, or as embedded (and not on a stand-alone basis) in the Company’s products or services, provided the Software is used solely to  interact or communicate with the Service.  “Service” means the bitdrift services made available by bitdrift as more fully described at the following URL: https://bitdrift.io.   

    3. License Restrictions.   Except with bitdrift’s prior written consent, Customer may not: (a) exceed the scope of the licenses granted in Section 2; (b) use the Software or any component thereof to run, or in connection with any system or service other than the Service; (c) reverse engineer, decompile, disassemble or otherwise attempt to learn the source code, structure or algorithms underlying the Software, except to the extent required to be permitted under applicable law; (d) modify, translate or create derivative works of the Software; (e) remove any copyright, trademark, patent or other proprietary notice that appears on the Software or copies thereof; or (f) combine or distribute any of the Software with any third party software that is licensed under terms that seek to require that any of the Software (or any associated intellectual property rights) be provided in source code form (e.g., as “open source”), or distributed without charge.

    4. Proprietary Rights.  The Software is licensed and not sold to you.  bitdrift and its licensors own and retain all right, title and interest in the Software, any design changes, improvements, enhancements, derivative works, and any related and associated intellectual property rights.  You may provide suggestions and input regarding the Software or Documentation, including but not limited to improvements, modifications, and enhancements regarding the same (“Feedback”).  You hereby grant to bitdrift a right to use, modify and distribute the Feedback in connection with bitdrift’s product and services.

    5. Term and Termination.  This Agreement and your right to use the Software may be terminated by you or by bitdrift at any time upon written notice.  Upon any expiration or termination of this Agreement, the license granted in Section 2 shall terminate immediately, and you shall (i) immediately cease use of all Software and Documentation, and (ii) return to bitdrift all Software and related Documentation and other materials and information provided by bitdrift and any copies thereof made by you. 

    6. NO WARRANTY.  CUSTOMER ACKNOWLEDGES AND AGREES THAT, THE SOFTWARE AND DOCUMENTATION ARE PROVIDED “AS IS”, AND THAT BITDRIFT MAKES NO EXPRESS OR IMPLIED REPRESENTATIONS OR WARRANTIES OF ANY KIND WITH RESPECT TO THE SOFTWARE OR DOCUMENTATION, OR THEIR CONDITION.  BITDRIFT HEREBY EXPRESSLY EXCLUDES, ANY AND ALL OTHER EXPRESS OR IMPLIED REPRESENTATIONS OR WARRANTIES, WHETHER UNDER COMMON LAW, STATUTE OR OTHERWISE, INCLUDING WITHOUT LIMITATION ANY AND ALL WARRANTIES AS TO MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, SATISFACTORY QUALITY OR NON-INFRINGEMENT OF THIRD-PARTY RIGHTS. bitdrift does not represent or warrant that the operation of the Software (or any portion thereof) will be uninterrupted or error free, or that the Software (or any portion thereof) will operate in combination with other hardware, software, systems or data not provided by bitdrift.

    7. LIMITATION OF LIABILITY.  IN NO EVENT SHALL BITDRIFT BE LIABLE IN AN ACTION UNDER TORT, CONTRACT, WARRANTY OR OTHERWISE FOR ANY: SPECIAL, INDIRECT, CONSEQUENTIAL, INCIDENTAL OR PUNITIVE DAMAGES  NOTWITHSTANDING ANYTHING TO THE CONTRARY IN THIS AGREEMENT, IN NO EVENT SHALL BITDRIFT’S TOTAL LIABILITY FOR DAMAGES, LOSSES OR LIABILITY OF ANY KIND EXCEED, EITHER CUMULATIVELY OR IN THE AGGREGATE, ONE THOUSAND US DOLLARS ($1,000). 

    8. Injunctive Relief. You acknowledge and agree that your breach or threatened breach of this Agreement shall cause bitdrift irreparable damage for which recovery of money damages would be inadequate and that bitdrift therefore may obtain timely injunctive relief to protect its rights under this Agreement in addition to any and all other remedies available at law or in equity.

    9. Export Controls.  The Software and Documentation and the underlying information and technology may not be downloaded or otherwise exported or re-exported (i) into (or to a national or resident of) any country to which the U.S. has embargoed goods; or (ii) to anyone on the U.S. Treasury Department’s list of Specially Designated Nationals or the U.S. Commerce Department’s Table of Deny Orders.  By downloading or using the Software and/or Documentation, you are agreeing to the foregoing and you represent and warrant that you are not located in, under the control of, or a national or resident of any such country or on any such list and you agree to comply with all export laws and other applicable laws. 

    10. U.S. Government End Users.  The Software and Documentation each were developed by private financing and constitute “Commercial Items,” as that term is defined at 48 C.F.R. §2.101.  The Software consists of “Commercial Computer Software” and “Commercial Computer Software Documentation,” as such terms are used in 48 C.F.R. §12.212. Consistent with 48 C.F.R. §12.212 and 48 C.F.R. §227.7202-1 through 227.7202-4, all U.S. Government End Users acquire only those rights in the Software and the Documentation that are specifically provided by this Agreement.  Consistent with 48 C.F.R. §12.211, all U.S. Government End Users acquire only technical data and the rights in that data customarily as specifically provided in this Agreement.

    11. Miscellaneous.  Except to the extent applicable law, if any, provides otherwise, this Agreement shall be governed by the laws of California, U.S.A., excluding its conflict of law provisions. You expressly agree that jurisdiction for any claim or dispute arising from the use of the bitdrift Software resides in the federal and state courts situated in the Santa Clara County, California, U.S.A., and you consent to the personal jurisdiction thereof. This Agreement shall not be governed by the United Nations Convention on Contracts for the International Sale of Goods. If any part of this Agreement is held invalid or unenforceable, that part shall be construed to reflect the parties' original intent, and the remaining portions remain in full force and effect, or bitdrift may at its option terminate this Agreement. A waiver by either party of any term or condition of this Agreement or any breach thereof, in any one instance, shall not waive such term or condition or any subsequent breach thereof. You may not assign or otherwise transfer by operation of law or otherwise this Agreement or any rights or obligations herein. bitdrift may assign this Agreement to any person or entity at its sole discretion. This Agreement shall be binding upon and shall inure to the benefit of the parties, their successors and permitted assigns.

    LICENSE
  }
  s.platform = :ios, '13.0'
  s.swift_versions = ['5.9']
  s.frameworks = 'Network', 'UIKit'
  s.source = { http: "https://dl.bitdrift.io/sdk/ios/capture-0.9.99/Capture.zip" }
  s.vendored_frameworks = 'Capture.xcframework'
  s.pod_target_xcconfig = { 'APPLICATION_EXTENSION_API_ONLY' => 'YES' }
end

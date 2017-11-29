import React, { Component } from 'react';
import { Link, Element } from 'react-scroll';

import Header from '../components/Header';
import Footer from '../components/Footer';

export default class LegalPage extends Component {

  scrollNav = {
    offset: -140,
    duration: 500
  }

  render() {
    return (
      <div className='legal legal-page'>

        <Header />

        <main className="main">
          <div className="scroll">
            {this.renderNav()}
            {this.renderSections()}
          </div>
        </main>

        <Footer />

      </div>
    );
  }

  renderNav() {
    return (
      <div className="scroll__nav scroll__nav--fixed">
        <ul>
          <li role="presentation" className="scroll__li">
            <Link
              activeClass="active"
              spy={true}
              smooth={true}
              offset={this.scrollNav.offset}
              duration={this.scrollNav.duration}
              to="terms">
              Terms of Service 
            </Link>
          </li>
          <li role="presentation" className="scroll__li">
            <Link
              activeClass="active"
              spy={true}
              smooth={true}
              offset={this.scrollNav.offset}
              duration={this.scrollNav.duration}
              to="privacy">
              Privacy Policy
            </Link>
          </li>
        </ul>
      </div>
    );
  }

  renderSections() {
    return (
      <div className="scroll__content">
        <Element name="terms">
          {this.renderTerms()}   
        </Element>
        <hr className="container" />
        <Element name="privacy">
          {this.renderPrivacy()}
        </Element>
      </div>
    );
  }

  renderTerms() {
    return (
      <section className="scroll__section">
        <div className="container">
          <div className="container__reset">
            The UNTOUCHED User Agreement comprises these Terms of Service (“Terms”), our Privacy Policy and all incorporated policies.
            <br /><br />
            <b>UNTOUCHED Terms of Service</b>
            <br /><br />
            These Terms of Service (“<b>Terms</b>”) govern your access to and use of our website (the “<b>UNTOUCHED Service</b>”), and any information, text, graphics, photos or other materials uploaded, downloaded or appearing on the Service (collectively referred to as “<b>Content</b>”). Your access to and use of the Service are conditioned on your acceptance of and compliance with these Terms. By accessing or using the Service you agree to be bound by these Terms.
            <br /><br />  
            <b>1. Basic Terms</b>
            <br /><br />  
            You are responsible for your use of the Service, for any Content you post to the Service, and for any consequences thereof. Most Content you submit, post, or display through the UNTOUCHED Service is public by default and will be able to be viewed by other users and through third party Service and websites. You should only provide Content that you are comfortable sharing with others under these Terms.
            You may use the Service only if you can form a binding contract with UNTOUCHED and are not a person barred from receiving Service under the laws of Victoria, Australia or other applicable jurisdiction. If you are accepting these Terms and using the Service on behalf of a company, organization, government, or other legal entity, you represent and warrant that you are authorized to do so. You may use the Service only in compliance with these Terms and all applicable local, state, national,
            and international laws, rules and regulations.
            The Service that UNTOUCHED provides are always evolving and the form and nature of the Service that UNTOUCHED provides may change from time to time without prior notice to you. In addition, UNTOUCHED may stop (permanently or temporarily) providing the Service (or any features within the Service) to you or to users generally and may not be able to provide you with prior notice. We also retain the right to create limits on use and storage at our sole discretion at any time without prior
            notice to you.
            <br /><br />
            <b>2. Privacy</b>
            <br /><br />
            Any information that you or other users provide to UNTOUCHED is subject to our Privacy Policy, which governs our collection and use of your information. You understand that through your use of the Service you consent to the collection and use (as set forth in the Privacy Policy) of this information, including the transfer of this information to Australia and/or other countries for storage, processing and use by UNTOUCHED. As part of providing you the Service, we may need to provide you
            with certain communications, such as service announcements and administrative messages. These communications are considered part of the Service and your account, which you may not be able to opt-out from receiving.
            <br /><br />
            <b>3.1 Account ownership</b>
            <br /><br />
            UNTOUCHED accounts are owned by individuals, not by organizations. When you sign up and create an UNTOUCHED account, you are the owner of that account and all the data in it. Account owners are the only people who can access all new projects created in the account. 
            <br /><br />  
            UNTOUCHED accounts can have multiple owners. We recommend designating other owners you trust, so that updates can be made to the account when you’re not available.
            <br /><br />
            Owners are the only people who can add and remove other owners. Our legal responsibility is to the account owner(s), so we won’t let other people take over your account without your permission.
            <br /><br />
            <b>3.2 Designating other people as owners</b>
            <br /><br />
            An account owner can add or remove other owners from the admin dashboard. When you designate someone else as an account owner, they will have the same power to add and remove other owners (including you) at any time.
            <br /><br />
            <b>3.3 What happens when none of the current account owners are available?</b>
            <br /><br />
            It happens - people switch jobs, get laid off, go on extended leave - the account owner(s) may be unavailable for any number of reasons. Still, our obligation is to the current account owner(s). That means we’re unable to add new owners to the account without permission from a current account owner, communicated from the email address we have on file.
            <br /><br />
            The quickest route to add a new owner is often to contact a current owner, and ask them to log in and add another owner right away from the admin dashboard.
            <br /><br />
            Otherwise, we can also gladly reach out to any account owners at the email addresses we have on file, and request permission to add an owner. If it’s a company address and another employee has access to the inbox, the person who receives the email can grant permission to add a new owner. For security’s sake, permission must come from an address we have on file for a current account owner.
            <br /><br />
            When none of the above is an option, a court order is required to add another owner to the account. We will of course readily comply with any court orders to turn data over to the appropriate party.
            <br /><br />
            <b>3.4 Account terms</b>
            <ol>
              <li>You are responsible for maintaining the security of your account and password. The Company cannot and will not be liable for any loss or damage from your failure to comply with this security obligation.</li>
              <li>You are responsible for all content posted and activity that occurs under your account (even when content is posted by others who have their own logins under your account).</li>
              <li>You may not use the Service for any illegal purpose or to violate any laws in your jurisdiction (including but not limited to copyright laws).</li>
              <li>Your login may only be used by one person - a single login shared by multiple people is not permitted. You may create separate logins for as many people as you’d like.</li>
              <li>You must be a human. Accounts registered by “bots” or other automated methods are not permitted.</li>
            </ol>
            <b>4. Pricing and payment terms</b>
            <br /><br />
            The Service is offered with a free 30 day trial for new accounts. If you fail to pay after 30 days, your listing will be withdrawn until full payment is made.
            <br /><br />
            Pricing of Service is subject to change upon 30 days notice from us. Such notice may be provided at any time by posting the changes to the pricing page or the Service itself.
            <br /><br />
            <b>5. Content on the Service</b>
            <br /><br />
            All Content, whether publicly posted or privately transmitted, is the sole responsibility of the person who originated such Content. We may not monitor or control the Content posted via the Service and, we cannot take responsibility for such Content. Any use or reliance on any Content or materials posted via the Service or obtained by you through the Service is at your own risk.
            We do not endorse, support, represent or guarantee the completeness, truthfulness, accuracy, or reliability of any Content or communications posted via the Service or endorse any opinions expressed via the Service. You understand that by using the Service, you may be exposed to Content that might be offensive, harmful, inaccurate or otherwise inappropriate, or in some cases, postings that have been mislabeled or are otherwise deceptive. Under no circumstances will UNTOUCHED be liable in
            any way for any Content, including, but not limited to, any errors or omissions in any Content, or any loss or damage of any kind incurred as a result of the use of any Content posted, emailed, transmitted or otherwise made available via the Service or broadcast elsewhere.
            <br /><br />
            <b>6. Your Rights</b>
            <br /><br />
            You retain your rights to any Content you submit, post or display on or through the Service. By submitting, posting or displaying Content on or through the Service, you grant us a worldwide, non-exclusive, royalty-free license (with the right to sublicense) to use, copy, reproduce, process, adapt, modify, publish, transmit, display and distribute such Content in any and all media or distribution methods (now known or later developed).
            You agree that this license includes the right for UNTOUCHED to provide, promote, and improve the Service and to make Content submitted to or through the Service available to other companies, organizations or individuals who partner with UNTOUCHED for the syndication, broadcast, distribution or publication of such Content on other media and Service, subject to our terms and conditions for such Content use.
            Such additional uses by UNTOUCHED, or other companies, organizations or individuals who partner with UNTOUCHED, may be made with no compensation paid to you with respect to the Content that you submit, post, transmit or otherwise make available through the Service.
            We may modify or adapt your Content in order to transmit, display or distribute it over computer networks and in various media and/or make changes to your Content as are necessary to conform and adapt that Content to any requirements or limitations of any networks, devices, Service or media.
            You are responsible for your use of the Service, for any Content you provide, and for any consequences thereof, including the use of your Content by other users and our third party partners. You understand that your Content may be syndicated, broadcast, distributed, or published by our partners and if you do not have the right to submit Content for such use, it may subject you to liability. UNTOUCHED will not be responsible or liable for any use of your Content by UNTOUCHED in accordance
            with these Terms. You represent and warrant that you have all the rights, power and authority necessary to grant the rights granted herein to any Content that you submit.
            <br /><br />
            <b>7. Your License To Use the Service</b>
            <br /><br />
            UNTOUCHED gives you a personal, worldwide, royalty-free, non-assignable and non-exclusive license to use the software that is provided to you by UNTOUCHED as part of the Service. This license is for the sole purpose of enabling you to use and enjoy the benefit of the Service as provided by UNTOUCHED, in the manner permitted by these Terms.
            <br /><br />
            <b>8. UNTOUCHED Rights</b>
            <br /><br />
            All right, title, and interest in and to the Service (excluding Content provided by users) are and will remain the exclusive property of UNTOUCHED and its licensors. The Service is protected by copyright, trademark, and other laws of both Victoria, Australia and foreign countries. Nothing in the Terms gives you a right to use the UNTOUCHED name or any of the UNTOUCHED trademarks, logos, domain names, and other distinctive brand features. Any feedback, comments, or suggestions you may
            provide regarding UNTOUCHED, or the Service is entirely voluntary and we will be free to use such feedback, comments or suggestions as we see fit and without any obligation to you.
            <br /><br />
            <b>9. Restrictions on Content and Use of the Service</b>
            <br /><br />
            We reserve the right at all times (but will not have an obligation) to remove or refuse to distribute any Content on the Service, to suspend or terminate users, and to reclaim usernames without liability to you. We also reserve the right to access, read, preserve, and disclose any information as we reasonably believe is necessary to (i) satisfy any applicable law, regulation, legal process or governmental request, (ii) enforce the Terms, including investigation of potential violations
            hereof, (iii) detect, prevent, or otherwise address fraud, security or technical issues, (iv) respond to user support requests, or (v) protect the rights, property or safety of UNTOUCHED, its users and the public.
            Except as permitted through the UNTOUCHED Service, these Terms, you have to use the UNTOUCHED API if you want to reproduce, modify, create derivative works, distribute, sell, transfer, publicly display, publicly perform, transmit, or otherwise use the UNTOUCHED Service or Content on the UNTOUCHED Service.
            You may not do any of the following while accessing or using the Service: (i) access, tamper with, or use non-public areas of the Service, UNTOUCHED’s computer systems, or the technical delivery systems of UNTOUCHED’s providers; (ii) probe, scan, or test the vulnerability of any system or network or breach or circumvent any security or authentication measures; (iii) access or search or attempt to access or search the Service by any means (automated or otherwise) other than through our
            currently available, published interfaces that are provided by UNTOUCHED, unless you have been specifically allowed to do so in a separate agreement with UNTOUCHED (NOTE: crawling the Service is permissible if done in accordance with the provisions of the robots.txt file, however, scraping the Service without the prior consent of UNTOUCHED is expressly prohibited); (iv) forge any TCP/IP packet header or any part of the header information in any email or posting, or in any way use the
            Service to send altered, deceptive or false source-identifying information; or (v) interfere with, or disrupt, (or attempt to do so), the access of any user, host or network, including, without limitation, sending a virus, overloading, flooding, spamming, mail-bombing the Service, or by scripting the creation of Content in such a manner as to interfere with or create an undue burden on the Service.
            <br /><br />
            <b>10. Copyright Policy</b>
            <br /><br />
            UNTOUCHED respects the intellectual property rights of others and expects users of the Service to do the same. We will respond to notices of alleged copyright infringement that comply with applicable law and are properly provided to us. If you believe that your Content has been copied in a way that constitutes copyright infringement, please provide us with the following information: (i) a physical or electronic signature of the copyright owner or a person authorized to act on their
            behalf; (ii) identification of the copyrighted work claimed to have been infringed; (iii) identification of the material that is claimed to be infringing or to be the subject of infringing activity and that is to be removed or access to which is to be disabled, and information reasonably sufficient to permit us to locate the material; (iv) your contact information, including your address, telephone number, and an email address; (v) a statement by you that you have a good faith belief
            that use of the material in the manner complained of is not authorized by the copyright owner, its agent, or the law; and (vi) a statement that the information in the notification is accurate, and, under penalty of perjury, that you are authorized to act on behalf of the copyright owner.
            We reserve the right to remove Content alleged to be infringing without prior notice, at our sole discretion, and without liability to you. In appropriate circumstances, UNTOUCHED will also terminate a user’s account if the user is determined to be a repeat infringer. Our designated copyright agent for notice of alleged copyright infringement appearing on the Service is:
            <br /><br />
            UNTOUCHED<br />
            Attn: Copyright Agent<br />
            PO BOX 2255 <br />
            Moorabbin VIC 3189<br />
            Email: sasha@untouched.co
            <br /><br />
            <b>11. Ending These Terms</b>
            <br /><br />
            The Terms will continue to apply until terminated by either you or UNTOUCHED as follows.
            You may end your legal agreement with UNTOUCHED at any time for any or no reason by deactivating your accounts and discontinuing your use of the Service. You do not need to specifically inform UNTOUCHED when you stop using the Service. If you stop using the Service without deactivating your accounts, your accounts may be deactivated due to prolonged inactivity.
            We may suspend or terminate your accounts or cease providing you with all or part of the Service at any time for any or no reason, including, but not limited to, if we reasonably believe: (i) you have violated these Terms, (ii) you create risk or possible legal exposure for us; or (iii) our provision of the Service to you is no longer commercially viable. We will make reasonable efforts to notify you by the email address associated with your account or the next time you attempt to access
            your account.
            Nothing in this section shall affect UNTOUCHED’s rights to change, limit or stop the provision of the Service without prior notice, as provided above in section 1.
            <br /><br />
            <b>12. Disclaimers and Limitations of Liability</b>
            <br /><br />
            Please read this section carefully since it limits the liability of UNTOUCHED and its parents, subsidiaries, affiliates, related companies, officers, directors, employees, agents, representatives, partners, and licensors (collectively, the “UNTOUCHED Entities”). Each of the subsections below only applies up to the maximum extent permitted under applicable law. Some jurisdictions do not allow the disclaimer of implied warranties or the limitation of liability in contracts, and as a result
            the contents of this section may not apply to you. Nothing in this section is intended to limit any rights you may have which may not be lawfully limited.
            <br /><br />
            <b>A. The Service are Available “AS-IS”</b>
            <br /><br />
            Your access to and use of the Service or any Content are at your own risk. You understand and agree that the Service are provided to you on an “AS IS” and “AS AVAILABLE” basis. Without limiting the foregoing, to the maximum extent permitted under applicable law, UNTOUCHED DISCLAIM ALL WARRANTIES AND CONDITIONS, WHETHER EXPRESS OR IMPLIED, OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT.
            UNTOUCHED make no warranty or representation and disclaim all responsibility and liability for: (i) the completeness, accuracy, availability, timeliness, security or reliability of the Service or any Content; (ii) any harm to your computer system, loss of data, or other harm that results from your access to or use of the Service or any Content; (iii) the deletion of, or the failure to store or to transmit, any Content and other communications maintained by the Service; and (iv) whether
            the Service will meet your requirements or be available on an uninterrupted, secure, or error-free basis. No advice or information, whether oral or written, obtained from UNTOUCHED or through the Service, will create any warranty or representation not expressly made herein.
            <br /><br />
            <b>B. Links</b>
            <br /><br />
            The Service may contain links to third-party websites or resources. You acknowledge and agree that UNTOUCHED are not responsible or liable for: (i) the availability or accuracy of such websites or resources; or (ii) the content, products, or Service on or available from such websites or resources. Links to such websites or resources do not imply any endorsement by UNTOUCHED of such websites or resources or the content, products, or Service available from such websites or resources. You
            acknowledge sole responsibility for and assume all risk arising from your use of any such websites or resources.
            <br /><br />
            <b>C. Limitation of Liability</b>
            <br /><br />
            TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, UNTOUCHED SHALL NOT BE LIABLE FOR ANY INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL OR PUNITIVE DAMAGES, OR ANY LOSS OF PROFITS OR REVENUES, WHETHER INCURRED DIRECTLY OR INDIRECTLY, OR ANY LOSS OF DATA, USE, GOOD-WILL, OR OTHER INTANGIBLE LOSSES, RESULTING FROM (i) YOUR ACCESS TO OR USE OF OR INABILITY TO ACCESS OR USE THE Service; (ii) ANY CONDUCT OR CONTENT OF ANY THIRD PARTY ON THE Service, INCLUDING WITHOUT LIMITATION, ANY DEFAMATORY,
            OFFENSIVE OR ILLEGAL CONDUCT OF OTHER USERS OR THIRD PARTIES; (iii) ANY CONTENT OBTAINED FROM THE Service; OR (iv) UNAUTHORIZED ACCESS, USE OR ALTERATION OF YOUR TRANSMISSIONS OR CONTENT.
            IN NO EVENT SHALL THE AGGREGATE LIABILITY OF UNTOUCHED EXCEED THE GREATER OF ONE HUNDRED AUSTRALIAN DOLLARS (AUD $100.00) OR THE AMOUNT YOU PAID UNTOUCHED, IF ANY, IN THE PAST SIX MONTHS FOR THE Service GIVING RISE TO THE CLAIM.
            THE LIMITATIONS OF THIS SUBSECTION SHALL APPLY TO ANY THEORY OF LIABILITY, WHETHER BASED ON WARRANTY, CONTRACT, STATUTE, TORT (INCLUDING NEGLIGENCE) OR OTHERWISE, AND WHETHER OR NOT UNTOUCHED HAVE BEEN INFORMED OF THE POSSIBILITY OF ANY SUCH DAMAGE, AND EVEN IF A REMEDY SET FORTH HEREIN IS FOUND TO HAVE FAILED OF ITS ESSENTIAL PURPOSE.
            <br /><br />
            <b>13. General Terms</b>
            <br /><br />
            <b>A. Waiver and Severability</b>
            <br />
            The failure of UNTOUCHED to enforce any right or provision of these Terms will not be deemed a waiver of such right or provision. In the event that any provision of these Terms is held to be invalid or unenforceable, then that provision will be limited or eliminated to the minimum extent necessary, and the remaining provisions of these Terms will remain in full force and effect.
            <br /><br />
            <b>B. Controlling Law and Jurisdiction</b>
            <br />
            These Terms and any action related thereto will be governed by the laws of the State of Victoria, Australia without regard to or application of its conflict of law provisions or your state or country of residence. All claims, legal proceedings or litigation arising in connection with the Service will be brought solely in the federal or state courts located in Melbourne, Victoria, Australia, and you consent to the jurisdiction of and venue in such courts and waive any objection as to
            inconvenient forum.
            <br /><br />
            <b>C. Entire Agreement</b>
            <br />
            These Terms for the UNTOUCHED Service, and our Privacy Policy are the entire and exclusive agreement between UNTOUCHED and you regarding the Service (excluding any Service for which you have a separate agreement with UNTOUCHED that is explicitly in addition or in place of these Terms), and these Terms supersede and replace any prior agreements between UNTOUCHED and you regarding the Service. Other than UNTOUCHED, no other person or company will be third party beneficiaries to the Terms.
            We may revise these Terms from time to time, the most current version will always be at untouched.co/tos. If the revision, in our sole discretion, is material we will notify you via an e-mail to the email associated with your account. By continuing to access or use the Service after those revisions become effective, you agree to be bound by the revised Terms.
            <br /><br />
            If you have any questions about these Terms, please contact us:
            <br /><br />
            UNTOUCHED
            <br />
            PO BOX 2255 
            <br />
            Moorabbin VIC 3189
            <br />
            Email: sasha@untouched.co
            <br /><br />
            <br />
            <b>Effective: June 13th, 2016</b>
          </div>
        </div>
      </section>
    );
  }

  renderPrivacy() {
    return (
      <section className="scroll__section scroll__privacy">
        <div className="container">
          <div className="container__reset">
            <b>Privacy Policy</b>
            <br /><br />  
            We are bound by the Australian Privacy Principles under the Privacy Act 1988 (Cth) and we are committed to protecting the privacy and security of your personal information. This includes suitable measures to protect electronic information and materials stored and generated in hard copy. We are also subject to privacy and confidentiality obligations under other laws that govern our activities.
            <br /><br />
            We have developed this privacy policy in order for you to understand how we collect, use, communicate, disclose and otherwise make use of personal information as outlined below:
            <br />
            <ul>
              <li>We will collect personal information by lawful and fair means and, where appropriate, with the knowledge or consent of the individual concerned.</li>
              <li>Before or at the time of collecting personal information, we will identify the purposes for which information is being collected.</li>
              <li>We will collect and use personal information solely for fulfilling those purposes specified by us and for other ancillary purposes, unless we obtain the consent of the individual concerned or as required by law.</li>
              <li>We will not disclose your personal information to any third parties except the property developers or real estate agents whose development you have enquired about.</li>
              <li>Personal data should be relevant to the purposes for which it is to be used, and, to the extent necessary for those purposes, should be accurate, complete, and up-to-date.</li>
              <li>We will protect personal information by using reasonable security safeguards against loss or theft, as well as unauthorized access, disclosure, copying, use or modification.</li>
              <li>We will make readily available to customers information about our policies and practices relating to the management of personal information.</li>
              <li>We will only retain personal information for as long as necessary for the fulfilment of those purposes.</li>
            </ul>
            We are committed to conducting our business in accordance with these principles in order to ensure that the confidentiality of personal information is protected and maintained. 
            <br /><br />
            UNTOUCHED may change this privacy policy from time to time at UNTOUCHED's sole discretion. Your continued use of the website after any changes are made to the Privacy Policy will be deemed to constitute your acceptance of those changes. If you object to any changes, your only remedy is to discontinue your use of the website. You are responsible for keeping up to date of any changes by regularly reviewing the Privacy Policy. 
            <br /><br />
            To ask a question about this Privacy Policy, contact us at:
            <br /><br />
            UNTOUCHED
            <br />
            PO BOX 2255
            <br />
            Moorabbin VIC 3189
            <br />
            Email: sasha@untouched.co
            <br /><br />
            If any of your concerns have not been resolved to your satisfaction, you can contact the Federal Privacy Commissioner on 1300 363 992 or visit their website on www.privacy.gov.au.
          </div>
        </div>
      </section>
    );
  }
}
package com.pknu.pro.main.util;

import org.springframework.stereotype.Component;

@Component
public class MakeMail {
	
	public static final String SUBJECT = "요청하신 인증번호 입니다.";
	
	public static String makeContent(String str){
		String content = "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width:100%;background-color:#f8f8f9;letter-spacing:-1px\" align=\"center\">\n";
		content += "    <tbody>\n";
		content += "    	<tr>\n";
		content += "	        <td align=\"center\">\n";
		content += "	            <!-- 아웃룩용 max-width 핵 -->\n";
		content += "	            <!--[if (gte mso 9)|(IE)]>\n";
		content += "	            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n";
		content += "	                <tr>\n";
		content += "	                    <td width=\"595\">\n";
		content += "	            <![endif]-->\n";
		content += "	            <div style=\"max-width:595px; margin:0 auto\">\n";
		content += "	                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width:595px;width:100%;font-family:'나눔고딕',NanumGothic,'맑은고딕',Malgun Gothic,'돋움',Dotum,Helvetica,'Apple SD Gothic Neo',Sans-serif;background-color:#fff;-webkit-text-size-adjust:100%;text-align:left\" align=\"center\">\n";
		content += "	                    <!-- Header -->\n";
		content += "	                    <tbody>\n";
		content += "	                    	<tr>\n";
		content += "	                    		<td height=\"30\"></td>\n";
		content += "	                    	</tr>\n";
		content += "		                    <tr>\n";
		content += "		                        <td style=\"padding-right:27px; padding-left:21px\">\n";
		content += "		                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n";
		content += "		                                <tbody>\n";
		content += "			                                <tr>\n";
		content += "			                                    <td style=\"\" width=\"61\">\n";
		content += "			                                    </td>\n";
		content += "                            <td style=\"padding-left:5px\">\n";
		content += "                            </td>\n";
		content += "                        </tr>\n";
		content += "		                            	</tbody>\n";
		content += "                </table>\n";
		content += "            </td>\n";
		content += "        </tr>\n";
		content += "    <tr>\n";
		content += "    	<td height=\"13\"></td>\n";
		content += "    </tr>\n";
		content += "	<tr>\n";
		content += "        <td style=\"padding-right:27px; padding-left:18px;line-height:34px;font-size:29px;color:#424240;font-family:'나눔고딕',NanumGothic,'맑은고딕',Malgun Gothic,'돋움',Dotum,Helvetica,'Apple SD Gothic Neo',Sans-serif;\">\n";
		content += "            요청하신 인증번호를<br><span style=\"color:#1ec800\">발송해드립니다.</span>\n";
		content += "        </td>\n";
		content += "    </tr>\n";
		content += "    <tr>\n";
		content += "		<td height=\"22\"></td>\n";
		content += "    </tr>\n";
		content += "    <tr>\n";
		content += "    	<td height=\"1\" style=\"background-color: #e5e5e5;\"></td>\n";
		content += "    </tr>\n";
		content += "    <!-- //Header -->\n";
		content += "    <tr>\n";
		content += "        <td style=\"padding-top:24px; padding-right:27px; padding-bottom:32px; padding-left:20px\">\n";
		content += "            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"left\" width=\"100%\">\n";
		content += "                <tbody>\n";
		content += "                    <tr>\n";
		content += "                        <td style=\"font-size:14px;color:#696969;line-height:24px;font-family:'나눔고딕',NanumGothic,'맑은고딕',Malgun Gothic,'돋움',Dotum,Helvetica,'Apple SD Gothic Neo',Sans-serif;\">\n";
		content += "                            <strong>아래의 인증번호를 인증번호 입력창에 입력해 주세요.</strong>\n";
		content += "	                    </td>\n";
		content += "                    </tr>\n";
		content += "                    <tr>\n";
		content += "                    	<td height=\"24\"></td>\n";
		content += "                    </tr>\n";
		content += "                    <tr>\n";
		content += "                        <td style=\"font-size:14px;color:#696969;line-height:24px;font-family:'나눔고딕',NanumGothic,'맑은고딕',Malgun Gothic,'돋움',Dotum,Helvetica,'Apple SD Gothic Neo',Sans-serif;\">\n";
		content += "                            <strong>인증번호 : <span style=\"color:#009E25\">"+str+"</span></strong>\n";
		content += "                        </td>\n";
		content += "                    </tr>\n";
		content += "                    <tr>\n";
		content += "                    	<td height=\"24\"></td>\n";
		content += "                    </tr>\n";
		content += "                   	<tr>\n";
		content += "                      	 <td style=\"font-size:14px;color:#696969;line-height:24px;font-family:'나눔고딕',NanumGothic,'맑은고딕',Malgun Gothic,'돋움',Dotum,Helvetica,'Apple SD Gothic Neo',Sans-serif;\">\n";
		content += "                           			행복학원을 이용해 주셔서 감사합니다.<br>\n";
		content += "                     		       더욱 편리한 서비스를 제공하기 위해 항상 최선을 다하겠습니다.\n";
		content += "                      	 </td>\n";
		content += "                   	</tr>\n";
		content += "            	</tbody>\n";
		content += "        		    </table>\n";
		content += "  		      </td>\n";
		content += "  		  </tr>\n";
		content += "  		  <!-- footer -->\n";
		content += " 		   <tr>\n";
		content += " 		       <td style=\"padding-top:26px;padding-left:21px;padding-right:21px;padding-bottom:13px;background:#f9f9f9;font-size:12px;font-family:'나눔고딕',NanumGothic,'맑은고딕',Malgun Gothic,'돋움',Dotum,Helvetica,'Apple SD Gothic Neo',Sans-serif;color:#696969;line-height:17px\">\n";
		content += "  		      </td>\n";
		content += "  		  </tr>\n";
		content += "		   <tr>\n";
		content += "		        <td style=\"padding-left:21px;padding-right:21px;padding-bottom:57px;background:#f9f9f9;font-size:12px;font-family:Helvetica;color:#696969;line-height:17px\">\n";
		content += "		            Copyright Since 2016 <strong>행복학원</strong>. All rights reserved.\n";
		content += " 		       </td>\n";
		content += " 		   </tr>\n";
		content += " 		   <!-- //footer -->\n";
		content += "		</tbody></table>\n";
		content += "	            </div>\n";
		content += "	            <!--[if mso]>\n";
        content += "	            </td>\n";
        content += "	            </tr>\n";
        content += "	            </table>\n";
        content += "	            <![endif]-->\n";
        content += "	        </td>\n";
        content += "	    </tr>\n";
        content += "	</tbody>\n";
        content += "</table>\n";


		
		
		
		return content;
	}
	
	
	
}

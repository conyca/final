package com.pknu.pro.main.captcha;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import nl.captcha.Captcha;
import nl.captcha.audio.AudioCaptcha;
import nl.captcha.audio.producer.VoiceProducer;
import nl.captcha.servlet.CaptchaServletUtil;

@Component
public class AudioCaptCha {
	public void getAudioCaptCha(HttpServletRequest req, HttpServletResponse resp, String answer){
//		HttpSession session = request.getSession();
//		Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
//		String getAnswer = answer;
//		if( getAnswer == null || getAnswer.equals("")){
//			getAnswer = captcha.getAnswer();
//		}
//		AudioCaptcha audioCaptcha = new AudioCaptcha.Builder()
////				.addAnswer(new DefaultTextProducer(6, getAnswer.toCharArray()))
//				.addAnswer(new SetTextProducer(getAnswer))
//				.addNoise()
//				.build();
//		CaptchaServletUtil.writeAudio(response, audioCaptcha.getChallenge());
		
		 HttpSession session = req.getSession();
	        Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
	        String getAnswer = answer;
	        AudioCaptcha audiocaptcha = null;
	        if ( getAnswer == null || "".equals(getAnswer) ) getAnswer = captcha.getAnswer();
	        
	        String lan = req.getParameter("lan");
	        if( lan != null && "kor".equals(lan)) {
	            VoiceProducer vProd = new SetKorVoiceProducer(); //�ѱ� ������ �������ִ� ��ü ����
	            audiocaptcha = new AudioCaptcha.Builder()
	            .addAnswer(new SetTextProducer(getAnswer))
	            .addVoice(vProd) //�ѱ����������⸦ AudioCaptcha�� ����
	            .addNoise()
	            .build();
	        } else {            
	            audiocaptcha = new AudioCaptcha.Builder()
	            .addAnswer(new SetTextProducer(getAnswer))
	            .addNoise()
	            .build();
	        }
	                      
	        String agent = req.getParameter("agent"); //���������� ������ �޸��ؾ��Ұ�� �̿�.
	        CaptchaServletUtil.writeAudio(resp, audiocaptcha.getChallenge());
		
		
	}
		
}

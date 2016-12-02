package com.pknu.pro.main.captcha;

import java.awt.Color;
import java.awt.Font;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

import nl.captcha.Captcha;
import nl.captcha.backgrounds.GradiatedBackgroundProducer;
import nl.captcha.gimpy.BlockGimpyRenderer;
import nl.captcha.gimpy.DropShadowGimpyRenderer;
import nl.captcha.servlet.CaptchaServletUtil;
import nl.captcha.text.producer.NumbersAnswerProducer;
import nl.captcha.text.renderer.DefaultWordRenderer;

@Component
public class CaptCha {
	private static int width = 150;
	private static int height = 50;
	
	public void getCaptCha(HttpServletRequest request, HttpServletResponse response){
		
		// 폰트 ===============================================
		List<Font> fontList = new ArrayList<>();
		fontList.add(new Font("", Font.HANGING_BASELINE, 40));
		fontList.add(new Font("Courier", Font.ITALIC, 40));
		fontList.add(new Font("", Font.PLAIN, 40));
		List<Color> colorList = new ArrayList<>();
		colorList.add(Color.BLACK);
		// 폰트 ===============================================
		
		Captcha captcha = new Captcha.Builder(width, height)
				.addText(new NumbersAnswerProducer(6), new DefaultWordRenderer(colorList, fontList))
//				.gimp(new DropShadowGimpyRenderer()).gimp()
				.gimp(new BlockGimpyRenderer()).gimp()
				.addNoise().addBorder()
				.addBackground(new GradiatedBackgroundProducer())
				.build();
		request.getSession().setAttribute(Captcha.NAME, captcha);
		CaptchaServletUtil.writeImage(response, captcha.getImage());
				
	}
}

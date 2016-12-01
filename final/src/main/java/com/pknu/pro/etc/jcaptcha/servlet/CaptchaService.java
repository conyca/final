package com.pknu.pro.etc.jcaptcha.servlet;

import com.octo.captcha.service.image.ImageCaptchaService;
import com.octo.captcha.service.image.DefaultManageableImageCaptchaService;
public class CaptchaService
{
  // a singleton class
  private static ImageCaptchaService instance = new DefaultManageableImageCaptchaService();
  public static ImageCaptchaService getInstance()
  {
    return instance;
  }
} 

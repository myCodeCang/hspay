/** 
 * Project Name:hspay 
 * File Name:NumVeryCode.java 
 * Package Name:com.tool 
 * Date:2017年4月27日下午10:06:12 
 * Copyright (c) 2017, mm331347@136.com All Rights Reserved. 
 * 
 */
package com.tool;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;

import org.apache.commons.lang.StringUtils;

import com.jfinal.render.Render;

/**
 * @author Administrator
 * 
 */
public class NumVeryCode extends Render {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static final int WIDTH = 120;
	public static final int HEIGHT = 30;
	private String randomCodeKey;

	public NumVeryCode(String randomCodeKey) {
		if (StringUtils.isBlank(randomCodeKey))
			throw new IllegalArgumentException("randomCodeKey can not be blank");
		this.randomCodeKey = randomCodeKey;
	}

	/**
	 * 设置背景颜色
	 * 
	 * @param g
	 */
	private void setBackGroundColor(Graphics g) {
		// 设置背景颜色
		g.setColor(Color.WHITE);
		// 填充区域
		g.fillRect(0, 0, WIDTH, HEIGHT);
	}

	/**
	 * 设置边框
	 * 
	 * @param g
	 */
	private void setBorder(Graphics g) {
		// 设置边框颜色
		g.setColor(Color.BLUE);
		// 设置边框区域
		g.drawRect(1, 1, WIDTH - 2, HEIGHT - 2);
	}

	/**
	 * 画干扰线
	 * 
	 * @param g
	 */
	private void drawRandomLine(Graphics g) {
		// 设置干扰线的颜色
		g.setColor(getRandColor(200, 250));
		// 设置线条条数并开始画线
		for (int i = 0; i < 40; i++) {
			int x1 = new Random().nextInt(WIDTH);
			int y1 = new Random().nextInt(HEIGHT);
			int x2 = new Random().nextInt(WIDTH);
			int y2 = new Random().nextInt(HEIGHT);

			// 开始画线
			g.drawLine(x1, y1, x2, y2);
		}
	}

	/**
	 * 给定范围获得随机颜色
	 */
	private Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}

	/**
	 * 画随机汉字
	 * 
	 * @param g
	 */
	private String drawRandomChar(Graphics2D g) {
		StringBuffer sb = new StringBuffer();

		// 设置颜色
		g.setColor(Color.RED);

		// 设置字体
		g.setFont(new Font("宋体", Font.BOLD, 20));

		// 准备常用汉字集
		String base = "0123456789";

		int x = 5;

		// 控制字数,最多4个字
		for (int i = 0; i < 4; i++) {
			// 设置字体旋转角度
			int degree = new Random().nextInt() % 30;

			// 截取汉字
			String ch = base.charAt(new Random().nextInt(base.length())) + "";

			// 追加到sb中
			sb.append(ch);

			// 顺时针旋转
			g.rotate(degree * Math.PI / 180, x, 20);

			// 开始画汉字
			g.drawString(ch, x, 20);

			// 逆时针旋转
			g.rotate(-(degree * Math.PI / 180), x, 20);

			x += 30;
		}
		return sb.toString();
	}

	@Override
	public void render() {
		// 创建图片缓存
		BufferedImage bi = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);

		// 获得画布
		Graphics g = bi.getGraphics();

		// 设置背景颜色
		setBackGroundColor(g);

		// 设置边框
		setBorder(g);

		// 绘制干扰线
		drawRandomLine(g);

		// 产生随机汉字验证码
		String randomChar = drawRandomChar((Graphics2D) g);// 强制转换

		// 将产生的随机汉字验证码存进session中进行保存
		request.getSession().setAttribute(randomCodeKey, randomChar);

		// 设置响应信息的类型为图片类型
		response.setContentType("image/jpeg");

		// 控制Http缓存，设置响应头信息，防止浏览器缓存
		response.setDateHeader("expries", -1);
		response.setHeader("Cache-Control", "no-Cache");
		response.setHeader("Pargma", "no-Cache");

		// 将验证码图片写到浏览器中
		ServletOutputStream sos = null;
		try {
			sos = response.getOutputStream();
			ImageIO.write(bi, "jpg", sos);
		} catch (IOException e) {
			throw new RuntimeException(e);
		} finally {
			if (sos != null)
				try {
					sos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
	}
}

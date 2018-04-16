package com.pay.jdpay.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.HashMap;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.jfinal.kit.PathKit;

public class QrcodeUtil {

	/**
	 * 二维码生成
	 * 
	 * @param content
	 *            内容
	 * @param billNo
	 *            文件名称
	 * @param qrcodeWidth
	 *            宽度
	 * @param qrcodeHeight
	 *            高度
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public static String createQrcode(String content, String billNo, int qrcodeWidth, int qrcodeHeight) {
		String qrcodeFilePath = "";
		try {
			qrcodeFilePath = "/upload/qrcode/" + billNo + ".png";
			File targetDir = new File(PathKit.getWebRootPath() + qrcodeFilePath);
			if (!targetDir.exists()) {
				targetDir.mkdirs();
				String qrcodeFormat = "png";
				HashMap<EncodeHintType, String> hints = new HashMap<EncodeHintType, String>();
				hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
				BitMatrix bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, qrcodeWidth,
						qrcodeHeight, hints);

				BufferedImage image = new BufferedImage(qrcodeWidth, qrcodeHeight, BufferedImage.TYPE_INT_RGB);
				ImageIO.write(image, qrcodeFormat, targetDir);
				MatrixToImageWriter.writeToFile(bitMatrix, qrcodeFormat, targetDir);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qrcodeFilePath;
	}

	/**
	 * 解析二维码
	 * 
	 * @param filePath
	 * @return
	 */
	public static String decodeQr(String filePath) {
		String retStr = "";
		if ("".equalsIgnoreCase(filePath) && filePath.length() == 0) {
			return "图片路径为空!";
		}
		try {
//			BufferedImage bufferedImage = ImageIO.read(new FileInputStream(filePath));
//			LuminanceSource source = new BufferedImageLuminanceSource(bufferedImage);
//			Binarizer binarizer = new HybridBinarizer(source);
//			BinaryBitmap bitmap = new BinaryBitmap(binarizer);
//			HashMap<DecodeHintType, Object> hintTypeObjectHashMap = new HashMap<>();
//			hintTypeObjectHashMap.put(DecodeHintType.CHARACTER_SET, "UTF-8");
//			Result result = new MultiFormatReader().decode(bitmap, hintTypeObjectHashMap);
//			retStr = result.getText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return retStr;
	}
}

package com.dong.controller.common;
/**
 * 图片统一查看控制器
 */

import com.dong.config.PhotoConfig;
import com.dong.exception.CodeMsg;
import com.dong.exception.Result;
import com.dong.utils.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;


@RequestMapping("photo")
@RestController
public class PhotoController {
	
	@Autowired
	private ResourceLoader resourceLoader;

	@Autowired
	private PhotoConfig photoConfig;


	 Logger logger=LoggerFactory.getLogger(PhotoController.class);
	
	/**
	 * 系统统一的图片查看方法
	 * @param filename
	 * @return
	 */
	@GetMapping(value="/view")
	public ResponseEntity viewPhoto(@RequestParam(name="filename",required=true)String filename){
		Resource resource = resourceLoader.getResource("file:" + photoConfig.getUploadPhotoPath() + filename);
		try {
			return ResponseEntity.ok(resource);
		} catch (Exception e) {
			return ResponseEntity.notFound().build();
		}
	}

	@PostMapping(value = "upload_photo")
	public Result<String> upload_photo(@RequestParam("photo")MultipartFile photo){
		//获取图片的名称
		String originalFilename= photo.getOriginalFilename();
		//获取图片的后缀
		String suffix=originalFilename.substring(originalFilename.lastIndexOf("."),originalFilename.length());

		//图片格式不正确
		if(!photoConfig.getUploadPhotoSuffix().contains(suffix.toLowerCase())){
			return Result.exception(CodeMsg.UPLOAD_PHOTO_SUFFIX_ERROR);
		}

		if((photo.getSize()/1024)>photoConfig.getUploadPhotoMaxSize()){
			CodeMsg codeMsg=CodeMsg.UPLOAD_PHOTO_ERROR;
			codeMsg.setMsg("图片大小不能大于"+photoConfig.getUploadPhotoMaxSize()+"M");
			return Result.exception(codeMsg);
		}

		File file = new File(photoConfig.getUploadPhotoPath());
		//判断文件夹是否存在
		if(!file.exists()){
			file.mkdir();
		}

		file=new File(photoConfig.getUploadPhotoPath()+ StringUtil.dataFormat(new Date(),"yyyyMMdd" ));
		if(!file.exists()){
			file.mkdir();
		}

		String filename=StringUtil.dataFormat(new Date(),"yyyyMMdd" )+"/"+System.currentTimeMillis()+suffix;
        file=new File(photoConfig.getUploadPhotoPath()+filename);

		try {
			photo.transferTo(file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		logger.info(originalFilename+"图片上传成功");
		return Result.success(filename);
	}
}

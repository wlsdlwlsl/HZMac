package com.dogether.domain;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class ProductsVO {
	
	private String productID;
	private String productName;
	private String productContent;
	private int productPrice;
	private String product_fname;
	private String product_realfname;
	private long product_fsize;
	
	MultipartFile file;

	
	public MultipartFile getFile() {
	      return file;
	   }
	   public void setFile(MultipartFile file) {
	      this.file = file;
	      
	      // 업로드 파일 접근
	      if(! file.isEmpty()){
	         // b_fname : 사용자가 올린 파일명
	         this.product_fname = file.getOriginalFilename();
	         this.product_fsize = file.getSize();
	         
	         // b_realfname : 서버에 저장되는 파일명
	         UUID uuid = UUID.randomUUID();
	         // 여기서 this는 멤버변수 b_realfname 자기자신
	         this.product_realfname = uuid.toString() + "_" + product_fname;
	         
	         //***********************************************
	         // 해당 경로로 변경
	         //b_fname을 b_realfname으로 변경
	         File f = new File("D:\\SpringWeb\\Dogether\\src\\main\\webapp\\resources\\img\\shoppingmall\\productimgs\\"+product_realfname);
	         //여기 경로를 실제 서버에서 할때는 바꿔야함----@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	         try {
	            file.transferTo(f);
	         } catch (IllegalStateException e) {            
	            e.printStackTrace();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	   }
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductContent() {
		return productContent;
	}
	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProduct_fname() {
		return product_fname;
	}
	public void setProduct_fname(String product_fname) {
		this.product_fname = product_fname;
	}
	public String getProduct_realfname() {
		return product_realfname;
	}
	public void setProduct_realfname(String product_realfname) {
		this.product_realfname = product_realfname;
	}
	public long getProduct_fsize() {
		return product_fsize;
	}
	public void setProduct_fsize(long product_fsize) {
		this.product_fsize = product_fsize;
	}

	
}

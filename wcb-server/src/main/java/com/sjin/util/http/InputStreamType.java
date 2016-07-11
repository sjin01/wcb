package com.sjin.util.http;

import java.io.InputStream;
import java.io.Serializable;

/**
 * 发送附件的类型： <br>
 * 这个类应用于以下场景：比如说，客户端要上传一个或多个文件到一个文件服务器上，但因为跨域不支持客户端直接上传 <br>
 * 所以先把文件上传到应用服务器，在转传到文件服务器上。 <br>
 * 因为Apache的HttpClient组件支持InputStream的方式发送，所以直接把传到应用服务器的文件留转传到文件服务器上<br>
 * name：为附件的文件名<br>
 * inputStream： 为上传到应用服务器的文件流对象
 * @author zhangcong
 *
 */
public class InputStreamType implements Serializable {

	private static final long serialVersionUID = 824274235075003913L;
	private String name;
	private InputStream inputStream;

	public InputStreamType() {
	}

	public InputStreamType(String name, InputStream inputStream) {
		this.name = name;
		this.inputStream = inputStream;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

}

package com.sjin.util.http;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

public class SendFileHttp {

	/**
	 * 上传附件到 nginx 服务器
	 * @param serverUrl  服务器地址
	 * @param objects 要上传的附件数组：附件的数组必须是File[] 或者 InputStreamType[] 类型 <br>
	 * 但是很奇怪，如果是InputStreamType[]，用nginx服务器接收附件，没有任何数据返回<br>
	 * 估计是nginx的原因，因为用tomcat服务器接收图片是成功的。
	 * @return nginx相应的字符串
	 * @throws ClientProtocolException
	 * @throws java.io.IOException
	 */
	public static String send(String serverUrl, Object... objects)
			throws ClientProtocolException, IOException {
		
		if(objects.length == 0) return null;
		
		// 新建客户端请求
		CloseableHttpClient httpclient = HttpClients.createDefault(); 
		// 实例化 连接
		HttpPost httppost = new HttpPost(serverUrl);
		
		MultipartEntityBuilder multipartEntityBuilder = MultipartEntityBuilder.create();
		// 添加请求数据
		//multipartEntityBuilder.addTextBody("key", "value", ContentType.create("text/plain", "UTF-8"));
		// 添加附件
		for (int i = 0; i < objects.length; i++) {
			if(objects[i] instanceof File){
				multipartEntityBuilder.addBinaryBody("file"+(i+1), (File)objects[i]);
			}else if(objects[i] instanceof InputStreamType){
				InputStreamType it = (InputStreamType)objects[i];
				multipartEntityBuilder.addBinaryBody("file"+(i+1), it.getInputStream(), ContentType.DEFAULT_BINARY, it.getName());
			}else{
				throw new RuntimeException("不支持的参数类型！");
			}
		}

		// 生成 HTTP 实体
        HttpEntity httpEntity = multipartEntityBuilder.build();
		
        // 设置 POST 请求的实体部分
        httppost.setEntity(httpEntity);
        // 发送 HTTP 请求
        CloseableHttpResponse response = httpclient.execute(httppost);

		String jsonstr = null;
		
		if (200 == response.getStatusLine().getStatusCode()) {
			HttpEntity entity = response.getEntity();
			if (entity != null) {
				jsonstr = EntityUtils.toString(entity);
			}
		}
		
		response.close();
		httpclient.close();
		
		return jsonstr;
	}

	public static void main(String[] args) throws ClientProtocolException, IOException {
		String surl = "http://localhost:8080/eduz100zone-web/test/file/upload/tomcat";
		//String surl = "http://222.247.44.248:85/eduz100/upload4ck";
		//String surl = "http://192.168.2.211:8890/eduz100/upload4ck";
		
		String s = send(surl, new File("D:\\temporary\\shucai\\1.jpg"));
		System.out.println(s);
		
		String ss = send(surl, new File("D:\\temporary\\shucai\\1.jpg"), new File("D:\\temporary\\shucai\\2.jpg"));
		System.out.println(ss);
		
		InputStreamType it = new InputStreamType("6.jpg", 
				new FileInputStream("D:\\temporary\\shucai\\6.jpg"));
		String sss = send(surl, new File("D:\\temporary\\shucai\\5.jpg"), it);
		System.out.println(sss);
		
	}
}

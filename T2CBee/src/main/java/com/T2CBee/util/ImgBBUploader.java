package com.T2CBee.util;

import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.Base64;

@Component
public class ImgBBUploader {
    private static final String API_KEY = "2552371f017a7885040f65a053fef580";

    //Hướng dẫn dùng:

//    public static void main(String[] args) throws IOException {
//        Path imagePath = Paths.get("C:\\Users\\huanl\\Downloads\\Miu\\AnhR18 (1).jpg");
//        byte[] imageBytes = Files.readAllBytes(imagePath);
//        uploadImage(imageBytes, imagePath.getFileName().toString());
//    }

    public static String uploadImage(byte[] bytes, String fileName) {
        String uploadUrl = "https://api.imgbb.com/1/upload";
        String base64Image = Base64.getEncoder().encodeToString(bytes);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.MULTIPART_FORM_DATA);

        MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
        body.add("key", API_KEY);
        body.add("image", base64Image);
        if(fileName != null) body.add("name", fileName);

        HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(uploadUrl, HttpMethod.POST, requestEntity, String.class);

        //đống này để lấy url ảnh
        String jsonString = response.getBody();
        int displayUrlIndex = jsonString.indexOf("\"display_url\"");
        if (displayUrlIndex != -1) {
            int colonIndex = jsonString.indexOf(":", displayUrlIndex);
            if (colonIndex != -1) {
                int quoteIndex = jsonString.indexOf("\"", colonIndex);
                if (quoteIndex != -1) {
                    int closingQuoteIndex = jsonString.indexOf("\"", quoteIndex + 1);
                    if (closingQuoteIndex != -1) {
                        return jsonString.substring(quoteIndex + 1, closingQuoteIndex);
                    }
                }
            }
        }
        return null;
    }
}

package com.project.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.Document;

import com.google.code.facebookapi.FacebookException;
import com.google.code.facebookapi.FacebookJaxbRestClient;
import com.google.code.facebookapi.FacebookXmlRestClient;
import com.google.code.facebookapi.IFacebookRestClient;
import com.google.code.facebookapi.ProfileField;
import com.google.code.facebookapi.schema.FriendsGetResponse;
import com.google.code.facebookapi.schema.User;
import com.google.code.facebookapi.schema.UsersGetInfoResponse;

@Controller
public class FacebookController {
    
    private static final String apiKey = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    private static final String secret = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    @RequestMapping(value = "/facebook", method = RequestMethod.GET)
    public String facebook(@RequestParam(value = "session", required = false, defaultValue = "") String sessionStr,
                        ModelMap map) throws FacebookException, UnsupportedEncodingException, JSONException {

        // 로그인이 되지 않았다면 로그인을 시킨다. 파라메타로 session을 JSON 형태로 넘겨 받는다.
        if("".equals(sessionStr)) {
            //String nextPage = URLEncoder.encode("http://timex.w2dev.net/facebook/", "utf-8");
            String nextPage = "http://timex.w2dev.net/facebook/";
            StringBuffer forwardUri = new StringBuffer();
            forwardUri.append("http://www.facebook.com/login.php?api_key=").append(apiKey)
                .append("&next=").append(nextPage)
                .append("&cancel_url=").append(nextPage)
                .append("&extern=1&fbconnect=1&return_session=1")
                .append("&req_perms=email");
            return "redirect:" + forwardUri.toString();
        }
        
        // 파라메타중 session_key 분리
        JSONObject json = new JSONObject(sessionStr);
        String sessionKey = json.getString("session_key");

        IFacebookRestClient<Document> userClient = new FacebookXmlRestClient(apiKey, secret, sessionKey);
        FacebookJaxbRestClient jaxbClient = new FacebookJaxbRestClient(
                userClient.getApiKey(), userClient.getSecret(), sessionKey);
        
        // 사용자 정보 가져오기.
        List<Long> users = new ArrayList<Long>();
        users.add(userClient.users_getLoggedInUser());
        UsersGetInfoResponse userResponse = jaxbClient.users_getInfo(users, 
                EnumSet.of(ProfileField.UID, ProfileField.NAME, ProfileField.SEX, ProfileField.BIRTHDAY));
        User user = userResponse.getUser().get(0);
         
        map.put("user", user);
        
        // 친구 정보 가져오기.
        FriendsGetResponse friendResponse = (FriendsGetResponse) jaxbClient.friends_get(jaxbClient.getCacheUserId());
        List<Long> friends = friendResponse.getUid();
        UsersGetInfoResponse userResponse2 = jaxbClient.users_getInfo(friends, 
                EnumSet.of(ProfileField.UID, ProfileField.NAME, ProfileField.SEX, ProfileField.BIRTHDAY));
        List<User> friendsInfo = userResponse2.getUser();
        
        map.put("friend", friendsInfo);
         
        return "/facebook/index";
    }

}
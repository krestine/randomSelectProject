var fbUid;
var fbName;
var fbEmail;
var fbBirthday;
var fbIMGURL;

window.fbAsyncInit = function() {
    FB.init({
        appId: '1476314719280264',
        cookie: true, // enable cookies to allow the server to access
        // the session
        xfbml: true, // parse social plugins on this page
        version: 'v2.0' // use version 2.0
    });

    FB.getLoginStatus(function(response) {
        if (response.status === "connected") {
            var uid = response.authResponse.userID;
            var accessToken = response.authResponse.accessToken;
        } else if (response.status === "not_authorized") {
            console.log(response);
            console.log("not login");

        } else {
            console.log(response);
        }
    });

};

// Load the SDK asynchronously
(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id))
        return;
    js = d.createElement(s);
    js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

function fnLoginFB(response) {

    FB.login(function(response) {
        if (response) {
            //			FB.api("/me/picture", function(response) {
            //				fbIMGURL = response.data.url;
            //			});
            FB.api("/me", function(response) {
                fbUid = response.id;
                fbName = response.first_name + " " + response.last_name;
                fbEmail = response.email;
                fbBirthday = StringToDate(response.birthday);
                fbIMGURL = 'http://graph.facebook.com/' + fbUid + '/picture';
                console.log(response);
                console.log(fbIMGURL);

                ajaxFBRegisterMember();
            });
            // window.location.reload(true);
        }
    }, {
        scope: "public_profile, email, user_friends, user_birthday"
    });
}

function ajaxFBRegisterMember() {
    var formData = {
        fbId: fbUid,
        memNm: fbName,
        email: fbEmail,
        birth: fbBirthday,
        imgPath: fbIMGURL
    };

    $.ajax({
        type: "post",
        url: "fbLogin.do",
        data: JSON.stringify(formData),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        beforeSend: function() {
            console.log(formData);
        },
        error: function(e) {
            console.log(e.responseText);
        },
        success: function(data) {
            $.each(data, function(key) {
                var list = data[key];
                console.log(key + " = " + list);
            });
        }
    });
}

function StringToDate(strDate) {
    var dt = strDate.replace(/\//gi, "");
    var year = dt.substring(4);
    var month = dt.substring(0, 2);
    var day = dt.substring(2, 4);
    return year + month + day;
}

function facebookFriend(code, page) {
    FB
        .api(
            "/me/invitable_friends",
            function(response) {
                console.log(response.error);
                if (response && !response.error) {
                    console.log(response);
                    var data = response.data;
                    var friendsList = "<table border='1'>";
                    friendsList += "<tr><td>이름</td><td>사진 URL</td><td>is_silhouette</td></tr>";
                    for (var i = 0; i < data.length; i++) {
                        friendsList += "<tr>";
                        friendsList += "<td>" + data[i].name + "</td>";
                        friendsList += "<td><img src='" + data[i].picture.data.url + "'/></td>";
                        friendsList += "<td>" + data[i].picture.data.is_silhouette + "</td>";
                        friendsList += "</tr>";
                    }
                    friendsList += "</table>";
                    $("#status").html(friendsList);
                }
            });
}

function fnLogout() {
    FB.logout(function(response) {

        if (response) {
            console.log(fbName + "님이 로그아웃 하셨습니다.");
        }
        // window.location.reload(true);
    });
}
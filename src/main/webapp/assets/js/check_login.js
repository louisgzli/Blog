//$('#loginForm').on('submit', function() {
//    $(this).ajaxSubmit({
//        type: 'get',
//        url: '/xst/member/login',    //  填进你要处理表单信息的Servlet
//        data: $('#loginForm').formSerialize(),    //   字符串  name1=value1&name2=value2
//        success: function(responseJSON) {
//            var loginMsg = JSON.parse(responseJSON);
//            if( loginMsg.status ) {
//                alert('登陆成功');
//                location.href='/xst/index';    //  路径不对的话改一下
//                return true;
//            }
//            else {
//                $('.errorMsg').html(loginMsg.message);
//            }
//        }
//    });
//    $(this).resetForm();
//    return false;
//});
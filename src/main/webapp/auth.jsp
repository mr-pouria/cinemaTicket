<%@ page import="com.example.cinema.authentication.biz.States" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
    <link rel="stylesheet" href="${request.getContextPath()}/assets/styles/main.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ورود به سینماتیکت</title>
    <style>

        input:-webkit-autofill,
        input:-webkit-autofill:hover,
        input:-webkit-autofill:focus,


        body {
            font-family: 'vazir-medium', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-image: radial-gradient(circle at 20% 30%, rgba(212, 175, 55, 0.1) 0%, transparent 20%),
            radial-gradient(circle at 80% 70%, rgba(93, 173, 226, 0.1) 0%, transparent 20%);
            padding: 20px;
        }

        .login-container {
            background-color: var(--explicit-color);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(52, 73, 94, 0.1);
            width: 100%;
            max-width: 440px;
            padding: 40px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .login-container::before {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            width: 100%;
            height: 8px;
            background: linear-gradient(90deg, var(--primary), var(--light-blue));
        }

        .logo {
            margin-bottom: 30px;
            display: flex;
            justify-content: center;
        }

        .logo svg {
            width: 150px;
            height: 150px;
        }

        .logo path {
            fill: var(--primary);
        }

        h1 {
            color: var(--text-color);
            font-family: 'vazir-bold';
            font-size: 1.8rem;
            margin-bottom: 10px;
        }

        .subtitle {
            color: var(--text-color);
            opacity: 0.7;
            font-size: 0.9rem;
            margin-bottom: 30px;
        }

        .input-group {
            margin-bottom: 20px;
            text-align: right;
            position: relative;
        }

        .input-group label {
            display: block;
            margin-bottom: 8px;
            color: var(--text-color);
            font-size: 0.9rem;
        }

        #verificationCodeTimer {
            color: var(--text-color);
            font-size: 0.9rem;
            margin-top: 8px;
            opacity: 0.7;
            transition: all 0.2s ease-in-out;
            display: block;
        }

        #verificationCodeTimer.active {
            opacity: 1;
            cursor: pointer;
        }

        .input-group input {
            width: 100%;
            padding: 14px 16px;
            border: 2px solid var(--seperator-color);
            border-radius: 8px;
            font-family: 'vazir-medium';
            font-size: 1rem;
            transition: all 0.3s ease;
            background-color: var(--back-color);
            color: var(--text-color);

        }

        .input-group input:focus {
            border-color: var(--light-blue);
            outline: none;
            box-shadow: 0 0 0 3px rgba(93, 173, 226, 0.2);
            background-color: var(--explicit-color);
        }

        .btn-login {
            background-color: var(--primary);
            color: var(--explicit-color);
            border: none;
            padding: 16px;
            width: 100%;
            border-radius: 8px;
            font-family: 'vazir-bold';
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
            box-shadow: 0 4px 6px rgba(212, 175, 55, 0.2);
        }

        .btn-login:hover {
            background-color: #E8C143;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(212, 175, 55, 0.3);
        }

        .btn-login:active {
            transform: translateY(0);
        }

        .btn-container {
            display: flex;
            gap: 1rem;
        }

        .edit-btn {
            background-color: var(--seperator-color);
            color: var(--text-color);
            border: none;
            padding: 16px;
            width: 100%;
            border-radius: 8px;
            font-family: 'vazir-bold';
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
        }

        .edit-btn:hover {
            background-color: #C3C3C3FF;
            transform: translateY(-2px);
        }

        .edit-btn:active {
            transform: translateY(0);

        }

        .btn-login:active {
            transform: translateY(0);
        }


        .remember-me input {
            margin-left: 8px;
            accent-color: var(--primary);
        }


        .register-link a {
            color: var(--primary);
            text-decoration: none;
            font-family: 'vazir-bold';
            transition: color 0.3s;
        }

        .register-link a:hover {
            color: #E8C143;
            text-decoration: underline;
        }

        .film-clip {
            position: absolute;
            opacity: 0.05;
            z-index: -1;
        }

        .film-clip-1 {
            top: 20%;
            left: 10%;
            transform: rotate(15deg);
        }

        .film-clip-2 {
            bottom: 15%;
            right: 10%;
            transform: rotate(-10deg);
        }

        .warnMsg {
            padding: 0.4rem 0.5rem 0.4rem 1.4rem;
            background: #fadddc;
            display: flex;
            border-radius: 6px;
            border: 1px solid #d54b42;
            margin-bottom: 0.5rem;
        }

        .warnMsg span {
            color: var(--text-color);
            display: flex;
            align-items: center;
            text-align: justify;
            font-size: 0.83em;
        }

        .warnMsg span svg {
            width: 45px;
            height: 45px;
            transform: translateY(4px);
        }

        @media (max-width: 480px) {
            .login-container {
                padding: 30px 20px;
            }

            h1 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="logo">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 2834.88 2834.88">
            <path fill-rule="evenodd" fill="rgb(2.799988%, 1.800537%, 1.597595%)" fill-opacity="1"
                  d="M 1886.058594 1869.359375 L 2280.941406 1868.84375 L 1617.039062 1910.691406 L 2176.28125 1943.496094 L 1462.789062 1969.515625 L 1975.171875 1995.535156 L 1431.101562 2026.078125 L 1831.921875 2047.578125 L 1033.039062 2052.101562 L 1363.609375 2027.191406 L 969.695312 2011.363281 L 1387.03125 1972.886719 L 623.949219 1937.824219 L 1342.960938 1904.480469 L 553.703125 1871.105469 L 949.652344 1870.585938 C 855.054688 1761.789062 797.753906 1619.710938 797.753906 1464.359375 C 797.753906 1122.410156 1075.371094 844.789062 1417.320312 844.789062 C 1759.269531 844.789062 2036.890625 1122.410156 2036.890625 1464.359375 C 2036.890625 1619.128906 1980.019531 1760.71875 1886.058594 1869.359375 Z M 1298.441406 1870.128906 L 1536.269531 1869.816406 C 1537.730469 1862.304688 1538.488281 1854.546875 1538.488281 1846.605469 C 1538.488281 1779.730469 1484.199219 1725.441406 1417.320312 1725.441406 C 1350.449219 1725.441406 1296.148438 1779.730469 1296.148438 1846.605469 C 1296.148438 1854.652344 1296.941406 1862.519531 1298.441406 1870.128906 Z M 1156.25 1464.359375 C 1156.25 1397.488281 1101.949219 1343.191406 1035.078125 1343.191406 C 968.203125 1343.191406 913.90625 1397.488281 913.90625 1464.359375 C 913.90625 1531.238281 968.203125 1585.53125 1035.078125 1585.53125 C 1101.949219 1585.53125 1156.25 1531.238281 1156.25 1464.359375 Z M 1417.320312 1412.328125 C 1388.601562 1412.328125 1365.289062 1435.640625 1365.289062 1464.359375 C 1365.289062 1493.078125 1388.601562 1516.398438 1417.320312 1516.398438 C 1446.039062 1516.398438 1469.359375 1493.078125 1469.359375 1464.359375 C 1469.359375 1435.640625 1446.039062 1412.328125 1417.320312 1412.328125 Z M 1417.320312 960.949219 C 1350.449219 960.949219 1296.148438 1015.238281 1296.148438 1082.121094 C 1296.148438 1148.988281 1350.449219 1203.289062 1417.320312 1203.289062 C 1484.199219 1203.289062 1538.488281 1148.988281 1538.488281 1082.121094 C 1538.488281 1015.238281 1484.199219 960.949219 1417.320312 960.949219 Z M 1920.738281 1464.359375 C 1920.738281 1397.488281 1866.441406 1343.191406 1799.570312 1343.191406 C 1732.691406 1343.191406 1678.398438 1397.488281 1678.398438 1464.359375 C 1678.398438 1531.238281 1732.691406 1585.53125 1799.570312 1585.53125 C 1866.441406 1585.53125 1920.738281 1531.238281 1920.738281 1464.359375 Z M 2199.890625 1046.390625 L 2206.710938 1086.628906 L 2247.328125 1093.839844 L 2207.058594 1100.660156 L 2199.890625 1141.28125 L 2193.070312 1101 L 2152.410156 1093.839844 L 2192.691406 1087.019531 Z M 2172.898438 1328.039062 L 2179.148438 1364.949219 L 2216.398438 1371.539062 L 2179.488281 1377.789062 L 2172.898438 1415 L 2166.648438 1378.128906 L 2129.398438 1371.539062 L 2166.308594 1365.289062 Z M 892.472656 811.230469 L 898.71875 848.128906 L 935.929688 854.691406 L 899.0625 860.929688 L 892.472656 898.179688 L 886.226562 861.28125 L 848.976562 854.691406 L 885.878906 848.441406 Z M 661.296875 1159.640625 L 669.460938 1207.808594 L 718.089844 1216.429688 L 669.882812 1224.589844 L 661.296875 1273.21875 L 653.132812 1225.019531 L 604.503906 1216.429688 L 652.675781 1208.269531 Z M 778.1875 1074.78125 L 780.371094 1087.699219 L 793.441406 1090 L 780.488281 1092.21875 L 778.1875 1105.25 L 776.003906 1092.328125 L 762.972656 1090 L 775.886719 1087.808594 Z M 2098.351562 1223.171875 L 2100.539062 1236.089844 L 2113.570312 1238.390625 L 2100.648438 1240.570312 L 2098.351562 1253.640625 L 2096.171875 1240.71875 L 2083.101562 1238.390625 L 2096.011719 1236.199219 Z M 2006.53125 996.730469 L 2009.671875 1015.429688 L 2028.519531 1018.761719 L 2009.859375 1021.898438 L 2006.53125 1040.761719 L 2003.339844 1022.101562 L 1984.488281 1018.761719 L 2003.191406 1015.578125 Z M 2022.570312 782.539062 L 2027.941406 814.199219 L 2059.859375 819.828125 L 2028.210938 825.199219 L 2022.570312 857.121094 L 2017.210938 825.46875 L 1985.289062 819.828125 L 2016.941406 814.46875 L 2022.570312 782.550781 Z M 1815.578125 842.699219 L 1818.949219 862.589844 L 1839.03125 866.121094 L 1819.140625 869.488281 L 1815.578125 889.570312 L 1812.238281 869.679688 L 1792.160156 866.121094 L 1812.050781 862.738281 Z M 718.328125 1384.011719 L 723.121094 1412.289062 L 751.671875 1417.351562 L 723.390625 1422.140625 L 718.328125 1450.648438 L 713.539062 1422.371094 L 685.027344 1417.351562 L 713.308594 1412.558594 L 718.328125 1384.011719 "/>
        </svg>
    </div>

    <h1>به سینماتیکت خوش آمدید</h1>
    <c:if test='<%=request.getSession().getAttribute("state").equals(States.INITIAL_AUTH_REQUEST)%>'>
        <p class="subtitle">لطفا برای ادامه شماره همراه خود را وارد کنید</p>
    </c:if>
    <c:if test='<%=request.getSession().getAttribute("state").equals(States.VERIFY_TO_REGISTER) || request.getSession().getAttribute("state").equals(States.VERIFY_TO_LOGIN)%>'>
        <p class="subtitle">لطفا برای ادامه کد تایید ارسال شده به شماره همراه ${phoneNumber} را وارد کنید</p>
    </c:if>

    <form method="post" action="auth">
        <c:if test='<%=request.getSession().getAttribute("state").equals(States.INITIAL_AUTH_REQUEST)%>'>
            <div class="input-group">
                <label for="phoneNumber">شماره همراه</label>
                <input type="text" autocomplete="off" name="phoneNumber" id="phoneNumber" placeholder="*********09"
                       required>
            </div>
        </c:if>
        <c:if test='<%=request.getSession().getAttribute("state").equals(States.VERIFY_TO_REGISTER) || request.getSession().getAttribute("state").equals(States.VERIFY_TO_LOGIN)%>'>
            <div class="input-group">
                <label for="code">کد تایید</label>
                <input type="text" autocomplete="off" name="code" id="code" placeholder="•••••"
                       maxlength="5"
                       required>
                <span class="timer" id="verificationCodeTimer"></span>
            </div>
        </c:if>
        <c:if test='<%=request.getSession().getAttribute("state").equals(States.REGISTER)%>'>
            <div class="input-group">
                <label for="fullName">نام و نام خانوادگی</label>
                <input type="text" autocomplete="off" name="fullName" id="fullName" placeholder="نام و نام خانوادگی را وارد کنید"
                       required>
            </div>
        </c:if>
        <c:if test="${errorMsg != null}">
            <div class="warnMsg">
                    <span>
                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1"
                             x="0px" y="0px" viewBox="0 0 100 125" enable-background="new 0 0 100 100" fill="#d54b42"
                             xml:space="preserve"><circle cx="50" cy="61.345" r="2.655"/><path
                                d="M50,56.797c1.381,0,2.5-1.119,2.5-2.5V40c0-1.381-1.119-2.5-2.5-2.5s-2.5,1.119-2.5,2.5v14.297  C47.5,55.678,48.619,56.797,50,56.797z"/><path
                                d="M50,23c-14.888,0-27,12.112-27,27s12.112,27,27,27s27-12.112,27-27S64.888,23,50,23z M50,73c-12.682,0-23-10.318-23-23  s10.318-23,23-23s23,10.318,23,23S62.682,73,50,73z"/></svg>
                    </span>
                <span>${errorMsg}</span>
            </div>
        </c:if>
        <c:if test='<%=request.getSession().getAttribute("state").equals(States.INITIAL_AUTH_REQUEST)%>'>
            <button type="submit" class="btn-login">ورود | ثبت نام</button>
        </c:if>
        <c:if test='<%=request.getSession().getAttribute("state").equals(States.VERIFY_TO_REGISTER) || request.getSession().getAttribute("state").equals(States.VERIFY_TO_LOGIN)%>'>
            <div class="btn-container">
                <button type="button" onclick="reload()" class="edit-btn">ویرایش</button>
                <button type="submit" class="btn-login">تایید</button>
            </div>
            <script>
                const reload = ()=>
                    window.location.replace("/auth");
                const verificationCodeTimer = document.getElementById("verificationCodeTimer")
                let seconds = 120;
                verificationCodeTimer.innerText = seconds + " ثانیه تا ارسال مجدد کد"
                const interval = setInterval(() => {
                    if (seconds <= 0) {
                        clearInterval(interval)
                        verificationCodeTimer.innerText = "ارسال مجدد کد تایید"
                        verificationCodeTimer.classList.add("active")
                        verificationCodeTimer.onclick = () => {

                        }
                        return;
                    }
                    seconds--;
                    if (verificationCodeTimer)
                        verificationCodeTimer.innerText = seconds + " ثانیه تا ارسال مجدد کد"

                }, 1000)
            </script>
        </c:if>
        <c:if test='<%=request.getSession().getAttribute("state").equals(States.REGISTER)%>' >
            <div class="btn-container">
                <button type="submit" class="btn-login">ثبت نام</button>
            </div>
        </c:if>
    </form>

    <svg class="film-clip film-clip-1" width="80" height="80" viewBox="0 0 24 24">
        <path d="M4 8H8V4H16V8H20V16H16V20H8V16H4V8Z" fill="var(--primary)"/>
    </svg>

    <svg class="film-clip film-clip-2" width="60" height="60" viewBox="0 0 24 24">
        <path d="M4 8H8V4H16V8H20V16H16V20H8V16H4V8Z" fill="var(--light-blue)"/>
    </svg>
</div>
</body>
</html>
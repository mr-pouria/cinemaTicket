<%@ page import="com.example.cinema.user.data.UserTO" %><%--
  Created by IntelliJ IDEA.
  User: pouria
  Date: 7/27/2025
  Time: 12:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/styles/main.css">

<header>
    <div class="container header-container">
        <div class="logo">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 2834.88 2834.88">
                <path fill-rule="evenodd" fill="rgb(2.799988%, 1.800537%, 1.597595%)" fill-opacity="1"
                      d="M 1886.058594 1869.359375 L 2280.941406 1868.84375 L 1617.039062 1910.691406 L 2176.28125 1943.496094 L 1462.789062 1969.515625 L 1975.171875 1995.535156 L 1431.101562 2026.078125 L 1831.921875 2047.578125 L 1033.039062 2052.101562 L 1363.609375 2027.191406 L 969.695312 2011.363281 L 1387.03125 1972.886719 L 623.949219 1937.824219 L 1342.960938 1904.480469 L 553.703125 1871.105469 L 949.652344 1870.585938 C 855.054688 1761.789062 797.753906 1619.710938 797.753906 1464.359375 C 797.753906 1122.410156 1075.371094 844.789062 1417.320312 844.789062 C 1759.269531 844.789062 2036.890625 1122.410156 2036.890625 1464.359375 C 2036.890625 1619.128906 1980.019531 1760.71875 1886.058594 1869.359375 Z M 1298.441406 1870.128906 L 1536.269531 1869.816406 C 1537.730469 1862.304688 1538.488281 1854.546875 1538.488281 1846.605469 C 1538.488281 1779.730469 1484.199219 1725.441406 1417.320312 1725.441406 C 1350.449219 1725.441406 1296.148438 1779.730469 1296.148438 1846.605469 C 1296.148438 1854.652344 1296.941406 1862.519531 1298.441406 1870.128906 Z M 1156.25 1464.359375 C 1156.25 1397.488281 1101.949219 1343.191406 1035.078125 1343.191406 C 968.203125 1343.191406 913.90625 1397.488281 913.90625 1464.359375 C 913.90625 1531.238281 968.203125 1585.53125 1035.078125 1585.53125 C 1101.949219 1585.53125 1156.25 1531.238281 1156.25 1464.359375 Z M 1417.320312 1412.328125 C 1388.601562 1412.328125 1365.289062 1435.640625 1365.289062 1464.359375 C 1365.289062 1493.078125 1388.601562 1516.398438 1417.320312 1516.398438 C 1446.039062 1516.398438 1469.359375 1493.078125 1469.359375 1464.359375 C 1469.359375 1435.640625 1446.039062 1412.328125 1417.320312 1412.328125 Z M 1417.320312 960.949219 C 1350.449219 960.949219 1296.148438 1015.238281 1296.148438 1082.121094 C 1296.148438 1148.988281 1350.449219 1203.289062 1417.320312 1203.289062 C 1484.199219 1203.289062 1538.488281 1148.988281 1538.488281 1082.121094 C 1538.488281 1015.238281 1484.199219 960.949219 1417.320312 960.949219 Z M 1920.738281 1464.359375 C 1920.738281 1397.488281 1866.441406 1343.191406 1799.570312 1343.191406 C 1732.691406 1343.191406 1678.398438 1397.488281 1678.398438 1464.359375 C 1678.398438 1531.238281 1732.691406 1585.53125 1799.570312 1585.53125 C 1866.441406 1585.53125 1920.738281 1531.238281 1920.738281 1464.359375 Z M 2199.890625 1046.390625 L 2206.710938 1086.628906 L 2247.328125 1093.839844 L 2207.058594 1100.660156 L 2199.890625 1141.28125 L 2193.070312 1101 L 2152.410156 1093.839844 L 2192.691406 1087.019531 Z M 2172.898438 1328.039062 L 2179.148438 1364.949219 L 2216.398438 1371.539062 L 2179.488281 1377.789062 L 2172.898438 1415 L 2166.648438 1378.128906 L 2129.398438 1371.539062 L 2166.308594 1365.289062 Z M 892.472656 811.230469 L 898.71875 848.128906 L 935.929688 854.691406 L 899.0625 860.929688 L 892.472656 898.179688 L 886.226562 861.28125 L 848.976562 854.691406 L 885.878906 848.441406 Z M 661.296875 1159.640625 L 669.460938 1207.808594 L 718.089844 1216.429688 L 669.882812 1224.589844 L 661.296875 1273.21875 L 653.132812 1225.019531 L 604.503906 1216.429688 L 652.675781 1208.269531 Z M 778.1875 1074.78125 L 780.371094 1087.699219 L 793.441406 1090 L 780.488281 1092.21875 L 778.1875 1105.25 L 776.003906 1092.328125 L 762.972656 1090 L 775.886719 1087.808594 Z M 2098.351562 1223.171875 L 2100.539062 1236.089844 L 2113.570312 1238.390625 L 2100.648438 1240.570312 L 2098.351562 1253.640625 L 2096.171875 1240.71875 L 2083.101562 1238.390625 L 2096.011719 1236.199219 Z M 2006.53125 996.730469 L 2009.671875 1015.429688 L 2028.519531 1018.761719 L 2009.859375 1021.898438 L 2006.53125 1040.761719 L 2003.339844 1022.101562 L 1984.488281 1018.761719 L 2003.191406 1015.578125 Z M 2022.570312 782.539062 L 2027.941406 814.199219 L 2059.859375 819.828125 L 2028.210938 825.199219 L 2022.570312 857.121094 L 2017.210938 825.46875 L 1985.289062 819.828125 L 2016.941406 814.46875 L 2022.570312 782.550781 Z M 1815.578125 842.699219 L 1818.949219 862.589844 L 1839.03125 866.121094 L 1819.140625 869.488281 L 1815.578125 889.570312 L 1812.238281 869.679688 L 1792.160156 866.121094 L 1812.050781 862.738281 Z M 718.328125 1384.011719 L 723.121094 1412.289062 L 751.671875 1417.351562 L 723.390625 1422.140625 L 718.328125 1450.648438 L 713.539062 1422.371094 L 685.027344 1417.351562 L 713.308594 1412.558594 L 718.328125 1384.011719 "/>
            </svg>
            <span class="logo-text">سینما تیکت</span>
        </div>
        <ul class="nav-links">
            <li><a href="#">صفحه اصلی</a></li>
            <li><a href="#">فیلم‌ها</a></li>
            <li><a href="#">سینماها</a></li>
            <li><a href="#">پرفروش‌ترین‌ها</a></li>
            <li><a href="#">درباره ما</a></li>
            <li><a href="#">تماس با ما</a></li>
        </ul>
        <c:if test='<%=request.getSession().getAttribute("user") == null%>'>
            <div class="auth-buttons" onclick="goLoginPage()">
                <a href="auth" class="btn btn-primary">ورود / ثبت نام</a>
            </div>
        </c:if>

        <c:if test='<%=request.getSession().getAttribute("user") != null%>'>
            <div class="profile-buttons">
                <a href="profile" class="btn btn-primary"><%=((UserTO)request.getSession().getAttribute("user")).getFullName()%></a>
            </div>
        </c:if>


    </div>
</header>
<script>
    const goLoginPage = () => {
        window.location.replace("${request.getContextPath()}/auth")
    }

</script>

<style>
    /* Header Styles */
    header {
        background-color: var(--explicit-color);
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        position: sticky;
        top: 0;
        z-index: 1000;
    }

    .header-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px 0;
    }

    .logo {
        display: flex;
        align-items: center;
    }

    .logo svg {
        width: 50px;
        height: 50px;
    }

    .logo path {
        fill: var(--primary);
    }

    .logo-text {
        font-family: 'vazir-bold';
        font-size: 1.5rem;
        margin-right: 10px;
        color: var(--primary);
    }

    .nav-links {
        display: flex;
        list-style: none;
    }

    .nav-links li {
        margin-right: 25px;
    }

    .nav-links a {
        text-decoration: none;
        color: var(--text-color);
        font-family: 'vazir-medium';
        transition: color 0.3s;
        position: relative;
    }

    .nav-links a:hover {
        color: var(--primary);
    }

    .nav-links a::after {
        content: '';
        position: absolute;
        bottom: -5px;
        right: 0;
        width: 0;
        height: 2px;
        background-color: var(--primary);
        transition: width 0.3s;
    }

    .nav-links a:hover::after {
        width: 100%;
    }

    .auth-buttons .btn , .profile-buttons .btn {
        padding: 10px 20px;
        border-radius: 8px;
        font-family: 'vazir-bold';
        cursor: pointer;
        transition: all 0.3s;
        text-decoration: none;
        margin-right: 10px;
    }

    .btn-primary {
        background-color: var(--primary);
        color: var(--explicit-color);
        border: none;
    }

    .btn-primary:hover {
        background-color: #E8C143;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(212, 175, 55, 0.3);
    }

    .btn-outline {
        border: 2px solid var(--primary);
        color: var(--primary);
        background-color: transparent;
    }

    .btn-outline:hover {
        background-color: rgba(212, 175, 55, 0.1);
    }

</style>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
    <link rel="stylesheet" href="assets/styles/main.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>سینما تیکت - خرید آنلاین بلیط سینما</title>
    <style>
        body {
            font-family: 'vazir-medium', sans-serif;
            background-color: var(--back-color);
            color: var(--text-color);
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(135deg, rgba(212, 175, 55, 0.1) 0%, rgba(93, 173, 226, 0.1) 100%);
            padding: 80px 0;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            width: 100%;
            height: 8px;
            background: linear-gradient(90deg, var(--primary), var(--light-blue));
        }

        .hero h1 {
            font-family: 'vazir-bold';
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: var(--text-color);
        }

        .hero p {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto 30px;
            line-height: 1.6;
        }

        /* Movies Section */
        .section-title {
            font-family: 'vazir-bold';
            font-size: 1.8rem;
            margin: 60px 0 30px;
            position: relative;
            padding-bottom: 15px;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            right: 0;
            width: 100px;
            height: 4px;
            background: linear-gradient(90deg, var(--primary), var(--light-blue));
            border-radius: 2px;
        }

        .movies-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 30px;
            margin-bottom: 60px;
        }

        .movie-card {
            background-color: var(--explicit-color);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .movie-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        .movie-poster {
            width: 100%;
            height: 350px;
            object-fit: cover;
        }

        .movie-info {
            padding: 20px;
        }

        .movie-title {
            font-family: 'vazir-bold';
            font-size: 1.1rem;
            margin-bottom: 10px;
        }

        .movie-meta {
            display: flex;
            justify-content: space-between;
            color: #777;
            font-size: 0.9rem;
            margin-bottom: 15px;
        }

        .movie-rating {
            display: flex;
            align-items: center;
            color: var(--primary);
            font-family: 'vazir-bold';
        }

        .movie-rating svg {
            margin-left: 5px;
        }

        .movie-btn {
            width: 100%;
            padding: 10px;
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: 6px;
            font-family: 'vazir-bold';
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .movie-btn:hover {
            background-color: #E8C143;
        }

        /* Cinemas Section */
        .cinemas {
            background-color: var(--explicit-color);
            padding: 60px 0;
            margin: 60px 0;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
        }

        .cinema-cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 30px;
        }

        .cinema-card {
            background-color: var(--explicit-color);
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s;
        }

        .cinema-card:hover {
            transform: translateY(-5px);
        }

        .cinema-name {
            font-family: 'vazir-bold';
            font-size: 1.3rem;
            margin-bottom: 10px;
            color: var(--primary);
        }

        .cinema-location {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            color: #777;
        }

        .cinema-location svg {
            margin-left: 5px;
        }

        .cinema-amenities {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 15px;
        }

        .amenity {
            background-color: rgba(93, 173, 226, 0.1);
            color: var(--light-blue);
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
        }

        /* Footer */
        footer {
            background-color: #2C3E50;
            color: white;
            padding: 60px 0 30px;
        }

        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 40px;
            margin-bottom: 40px;
        }

        .footer-column h3 {
            font-family: 'vazir-bold';
            font-size: 1.2rem;
            margin-bottom: 20px;
            position: relative;
            padding-bottom: 10px;
        }

        .footer-column h3::after {
            content: '';
            position: absolute;
            bottom: 0;
            right: 0;
            width: 50px;
            height: 2px;
            background-color: var(--primary);
        }

        .footer-links {
            list-style: none;
        }

        .footer-links li {
            margin-bottom: 12px;
        }

        .footer-links a {
            color: #BDC3C7;
            text-decoration: none;
            transition: color 0.3s;
        }

        .footer-links a:hover {
            color: var(--primary);
        }

        .social-links {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }

        .social-link {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background-color 0.3s;
        }

        .social-link:hover {
            background-color: var(--primary);
        }

        .copyright {
            text-align: center;
            padding-top: 30px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: #BDC3C7;
            font-size: 0.9rem;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .header-container {
                flex-direction: column;
            }

            .nav-links {
                margin: 20px 0;
            }

            .auth-buttons {
                margin-bottom: 20px;
            }

            .hero h1 {
                font-size: 2rem;
            }

            .hero p {
                font-size: 1rem;
            }
        }

        @media (max-width: 480px) {
            .nav-links {
                flex-direction: column;
                align-items: center;
            }

            .nav-links li {
                margin: 10px 0;
            }

            .movies-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<!-- Hero Section -->
<section class="hero">
    <div class="container">
        <h1>به سینما تیکت خوش آمدید</h1>
        <p>خرید آسان و سریع بلیط سینما از معتبرترین سینماهای کشور با بهترین قیمت‌ها و تخفیف‌های ویژه</p>
        <a href="#" class="btn btn-primary">مشاهده فیلم‌های اکران شده</a>
    </div>
</section>

<!-- Movies Section -->
<div class="container">
    <h2 class="section-title">فیلم‌های اکران شده</h2>
    <div class="movies-grid">
        <!-- Movie Card 1 -->
        <div class="movie-card">
            <img src="https://via.placeholder.com/300x450" alt="فیلم ۱" class="movie-poster">
            <div class="movie-info">
                <h3 class="movie-title">عنوان فیلم ۱</h3>
                <div class="movie-meta">
                    <span>درام</span>
                    <span>1402</span>
                </div>
                <div class="movie-rating">
                    <span>۸.۵</span>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="var(--primary)">
                        <path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/>
                    </svg>
                </div>
                <button class="movie-btn">خرید بلیط</button>
            </div>
        </div>

        <!-- Movie Card 2 -->
        <div class="movie-card">
            <img src="https://via.placeholder.com/300x450" alt="فیلم ۲" class="movie-poster">
            <div class="movie-info">
                <h3 class="movie-title">عنوان فیلم ۲</h3>
                <div class="movie-meta">
                    <span>اکشن</span>
                    <span>1402</span>
                </div>
                <div class="movie-rating">
                    <span>۹.۱</span>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="var(--primary)">
                        <path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/>
                    </svg>
                </div>
                <button class="movie-btn">خرید بلیط</button>
            </div>
        </div>

        <!-- Movie Card 3 -->
        <div class="movie-card">
            <img src="https://via.placeholder.com/300x450" alt="فیلم ۳" class="movie-poster">
            <div class="movie-info">
                <h3 class="movie-title">عنوان فیلم ۳</h3>
                <div class="movie-meta">
                    <span>کمدی</span>
                    <span>1401</span>
                </div>
                <div class="movie-rating">
                    <span>۷.۸</span>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="var(--primary)">
                        <path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/>
                    </svg>
                </div>
                <button class="movie-btn">خرید بلیط</button>
            </div>
        </div>

        <!-- Movie Card 4 -->
        <div class="movie-card">
            <img src="https://via.placeholder.com/300x450" alt="فیلم ۴" class="movie-poster">
            <div class="movie-info">
                <h3 class="movie-title">عنوان فیلم ۴</h3>
                <div class="movie-meta">
                    <span>علمی تخیلی</span>
                    <span>1402</span>
                </div>
                <div class="movie-rating">
                    <span>۸.۲</span>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="var(--primary)">
                        <path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/>
                    </svg>
                </div>
                <button class="movie-btn">خرید بلیط</button>
            </div>
        </div>
    </div>

    <h2 class="section-title">به زودی در سینماها</h2>
    <div class="movies-grid">
        <!-- Coming Soon Movie 1 -->
        <div class="movie-card">
            <img src="https://via.placeholder.com/300x450" alt="فیلم آینده ۱" class="movie-poster">
            <div class="movie-info">
                <h3 class="movie-title">عنوان فیلم آینده ۱</h3>
                <div class="movie-meta">
                    <span>فانتزی</span>
                    <span>1403</span>
                </div>
                <div class="movie-rating">
                    <span>-</span>
                </div>
                <button class="movie-btn" disabled>به زودی</button>
            </div>
        </div>

        <!-- Coming Soon Movie 2 -->
        <div class="movie-card">
            <img src="https://via.placeholder.com/300x450" alt="فیلم آینده ۲" class="movie-poster">
            <div class="movie-info">
                <h3 class="movie-title">عنوان فیلم آینده ۲</h3>
                <div class="movie-meta">
                    <span>تاریخی</span>
                    <span>1403</span>
                </div>
                <div class="movie-rating">
                    <span>-</span>
                </div>
                <button class="movie-btn" disabled>به زودی</button>
            </div>
        </div>

        <!-- Coming Soon Movie 3 -->
        <div class="movie-card">
            <img src="https://via.placeholder.com/300x450" alt="فیلم آینده ۳" class="movie-poster">
            <div class="movie-info">
                <h3 class="movie-title">عنوان فیلم آینده ۳</h3>
                <div class="movie-meta">
                    <span>ترسناک</span>
                    <span>1403</span>
                </div>
                <div class="movie-rating">
                    <span>-</span>
                </div>
                <button class="movie-btn" disabled>به زودی</button>
            </div>
        </div>

        <!-- Coming Soon Movie 4 -->
        <div class="movie-card">
            <img src="https://via.placeholder.com/300x450" alt="فیلم آینده ۴" class="movie-poster">
            <div class="movie-info">
                <h3 class="movie-title">عنوان فیلم آینده ۴</h3>
                <div class="movie-meta">
                    <span>انیمیشن</span>
                    <span>1403</span>
                </div>
                <div class="movie-rating">
                    <span>-</span>
                </div>
                <button class="movie-btn" disabled>به زودی</button>
            </div>
        </div>
    </div>
</div>

<!-- Cinemas Section -->
<section class="cinemas">
    <div class="container">
        <h2 class="section-title">سینماهای همکار</h2>
        <div class="cinema-cards">
            <!-- Cinema 1 -->
            <div class="cinema-card">
                <h3 class="cinema-name">سینما آزادی</h3>
                <div class="cinema-location">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="#777">
                        <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/>
                    </svg>
                    <span>تهران، میدان آزادی</span>
                </div>
                <p>سینما آزادی با سالن‌های مجهز و امکانات مدرن پذیرای شماست.</p>
                <div class="cinema-amenities">
                    <span class="amenity">پارکینگ</span>
                    <span class="amenity">فودکورت</span>
                    <span class="amenity">سالن VIP</span>
                </div>
            </div>

            <!-- Cinema 2 -->
            <div class="cinema-card">
                <h3 class="cinema-name">سینما فرهنگ</h3>
                <div class="cinema-location">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="#777">
                        <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/>
                    </svg>
                    <span>تهران، خیابان انقلاب</span>
                </div>
                <p>سینما فرهنگ با معماری مدرن و امکانات پیشرفته در قلب تهران.</p>
                <div class="cinema-amenities">
                    <span class="amenity">پارکینگ</span>
                    <span class="amenity">کافی شاپ</span>
                </div>
            </div>

            <!-- Cinema 3 -->
            <div class="cinema-card">
                <h3 class="cinema-name">سینما گلریز</h3>
                <div class="cinema-location">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="#777">
                        <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/>
                    </svg>
                    <span>تهران، سعادت آباد</span>
                </div>
                <p>سینما گلریز با سالن‌های دالبی اتمس و صندلی‌های ارگونومیک.</p>
                <div class="cinema-amenities">
                    <span class="amenity">پارکینگ</span>
                    <span class="amenity">رستوران</span>
                    <span class="amenity">سالن 4DX</span>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer>
    <div class="container">
        <div class="footer-content">
            <div class="footer-column">
                <h3>درباره سینما تیکت</h3>
                <p>سینما تیکت اولین و معتبرترین سامانه خرید آنلاین بلیط سینما در ایران با بیش از ۱۰ سال سابقه درخشان در خدمت‌رسانی به سینمادوستان.</p>
            </div>
            <div class="footer-column">
                <h3>لینک‌های مفید</h3>
                <ul class="footer-links">
                    <li><a href="#">سوالات متداول</a></li>
                    <li><a href="#">قوانین و مقررات</a></li>
                    <li><a href="#">حریم خصوصی</a></li>
                    <li><a href="#">همکاری با ما</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h3>تماس با ما</h3>
                <ul class="footer-links">
                    <li>تلفن پشتیبانی: ۱۲۳۴۵۶۷۸۹</li>
                    <li>آدرس ایمیل: info@cinematicket.com</li>
                    <li>آدرس: تهران، خیابان آزادی، پلاک ۱۲۳</li>
                </ul>
            </div>
            <div class="footer-column">
                <h3>ما را دنبال کنید</h3>
                <div class="social-links">
                    <a href="#" class="social-link">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="white">
                            <path d="M22.675 0h-21.35c-.732 0-1.325.593-1.325 1.325v21.351c0 .731.593 1.324 1.325 1.324h11.495v-9.294h-3.128v-3.622h3.128v-2.671c0-3.1 1.893-4.788 4.659-4.788 1.325 0 2.463.099 2.795.143v3.24l-1.918.001c-1.504 0-1.795.715-1.795 1.763v2.313h3.587l-.467 3.622h-3.12v9.293h6.116c.73 0 1.323-.593 1.323-1.325v-21.35c0-.732-.593-1.325-1.325-1.325z"/>
                        </svg>
                    </a>
                    <a href="#" class="social-link">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="white">
                            <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/>
                        </svg>
                    </a>
                    <a href="#" class="social-link">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="white">
                            <path d="M24 4.557c-.883.392-1.832.656-2.828.775 1.017-.609 1.798-1.574 2.165-2.724-.951.564-2.005.974-3.127 1.195-.897-.957-2.178-1.555-3.594-1.555-3.179 0-5.515 2.966-4.797 6.045-4.091-.205-7.719-2.165-10.148-5.144-1.29 2.213-.669 5.108 1.523 6.574-.806-.026-1.566-.247-2.229-.616-.054 2.281 1.581 4.415 3.949 4.89-.693.188-1.452.232-2.224.084.626 1.956 2.444 3.379 4.6 3.419-2.07 1.623-4.678 2.348-7.29 2.04 2.179 1.397 4.768 2.212 7.548 2.212 9.142 0 14.307-7.721 13.995-14.646.962-.695 1.797-1.562 2.457-2.549z"/>
                        </svg>
                    </a>
                </div>
            </div>
        </div>
        <div class="copyright">
            <p>تمامی حقوق این سایت متعلق به سینما تیکت می‌باشد. © ۱۴۰۲</p>
        </div>
    </div>
</footer>
</body>
</html>
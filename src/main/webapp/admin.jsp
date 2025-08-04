<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: pouria
  Date: 8/2/2025
  Time: 9:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>پنل مدیریت سینماتیکت</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${request.getContextPath()}/assets/styles/main.css">
    <style>

        * {
            font-family: "vazir-medium";
        }

        .admin-container {
            display: flex;
            max-height: 100vh;
            min-height: 100vh;
        }

        .sidebar {
            width: 280px;
            background: var(--explicit-color);
            box-shadow: 0 0 25px rgba(0, 0, 0, 0.08);
            display: flex;
            flex-direction: column;
            transition: all 0.3s;
            z-index: 100;
        }

        .logo {
            padding: 25px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-bottom: 1px solid var(--seperator-color);
        }

        .logo img {
            width: 45px;
            height: 45px;
            margin-left: 12px;
        }

        .logo h2 {
            font-family: 'vazir-bold';
            color: var(--primary);
            font-size: 1.5rem;
            margin: 0;
        }

        .admin-nav {
            flex: 1;
            padding: 25px 0;
        }

        .admin-nav ul {
            list-style: none;
        }

        .admin-nav li {
            margin-bottom: 3px;
        }

        .admin-nav a {
            display: flex;
            align-items: center;
            padding: 14px 25px;
            color: var(--text-color);
            text-decoration: none;
            transition: all 0.3s;
            font-size: 0.95rem;
            position: relative;
        }

        .admin-nav a:hover {
            background-color: rgba(212, 175, 55, 0.08);
            color: var(--primary);
        }

        .admin-nav a i {
            margin-left: 12px;
            font-size: 1.15rem;
            width: 24px;
            text-align: center;
        }

        .admin-nav .active a {
            background-color: rgba(212, 175, 55, 0.15);
            color: var(--primary);
        }

        .admin-nav .active a::before {
            content: '';
            position: absolute;
            right: 0;
            top: 0;
            height: 100%;
            width: 4px;
            background-color: var(--primary);
            border-radius: 0 4px 4px 0;
        }

        .user-panel {
            padding: 20px;
            border-top: 1px solid var(--seperator-color);
            display: flex;
            align-items: center;
            position: relative;
        }

        .user-avatar {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            overflow: hidden;
            margin-left: 12px;
            border: 2px solid var(--seperator-color);
        }

        .user-avatar img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .user-info {
            flex: 1;
        }

        .user-name {
            display: block;
            font-family: 'vazir-bold';
            font-size: 0.95rem;
        }

        .user-role {
            display: block;
            font-size: 0.85rem;
            color: #888;
            margin-top: 3px;
        }

        .logout-btn {
            color: var(--text-color);
            font-size: 1.2rem;
            transition: all 0.3s;
            opacity: 0.7;
        }

        .logout-btn:hover {
            color: var(--danger-color);
            opacity: 1;
        }

        .main-content {
            flex: 1;
            background-color: var(--back-color);
        }

        .content-header {
            padding: 25px 30px;
            background-color: var(--explicit-color);
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.05);
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: sticky;
            top: 0;
            z-index: 50;
        }

        .content-header h1 {
            font-family: 'vazir-bold';
            font-size: 1.6rem;
            margin: 0;
            color: #444;
        }

        .header-actions {
            display: flex;
            align-items: center;
        }

        .search-box {
            display: flex;
            margin-left: 20px;
            position: relative;
        }

        .search-box input {
            padding: 10px 20px 10px 45px;
            border: 1px solid var(--seperator-color);
            border-radius: 6px;
            font-family: 'vazir-medium';
            width: 280px;
            transition: all 0.3s;
            background-color: #f5f5f5;
            font-size: 0.9rem;
        }

        .search-box input:focus {
            outline: none;
            border-color: var(--primary);
            background-color: white;
            box-shadow: 0 0 0 3px rgba(212, 175, 55, 0.2);
        }

        .search-box button {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #999;
            font-size: 1rem;
            cursor: pointer;
        }

        .notifications {
            position: relative;
            font-size: 1.25rem;
            color: var(--text-color);
            cursor: pointer;
            margin-right: 15px;
            opacity: 0.8;
            transition: all 0.3s;
        }

        .notifications:hover {
            opacity: 1;
            color: var(--primary);
        }

        .notifications .badge {
            position: absolute;
            top: -5px;
            left: -5px;
            background-color: var(--danger-color);
            color: white;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            font-size: 0.75rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'vazir-bold';
        }

        .content-body {
            padding: 30px;
            background-color: var(--back-color);
            height: calc(100% - 95px);
            overflow: auto;
        }

        .quick-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 25px;
            margin-bottom: 35px;
        }

        .stat-card {
            background-color: var(--explicit-color);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.03);
            display: flex;
            align-items: center;
            transition: all 0.3s;
            border: 1px solid #f0f0f0;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
        }

        .stat-icon {
            width: 55px;
            height: 55px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.4rem;
            margin-left: 18px;
            flex-shrink: 0;
        }

        .stat-info {
            flex: 1;
        }

        .stat-title {
            display: block;
            font-size: 0.9rem;
            color: #777;
            margin-bottom: 8px;
            font-family: "vazir-medium";
        }

        .stat-value {
            display: block;
            font-family: 'vazir-bold';
            font-size: 1.7rem;
            color: #444;
        }

        .section-container {
            background-color: var(--explicit-color);
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.03);
            margin-bottom: 30px;
            border: 1px solid #f0f0f0;
        }

        .section-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 25px;
        }

        .section-header h2 {
            font-family: 'vazir-bold';
            font-size: 1.4rem;
            color: #444;
            margin: 0;
        }

        .view-all {
            color: var(--primary);
            text-decoration: none;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            transition: all 0.3s;
        }

        .view-all:hover {
            color: #b8931f;
        }

        .view-all i {
            margin-right: 5px;
            font-size: 0.9rem;
        }

        .movies-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 25px;
        }

        .movie-card {
            background-color: var(--back-color);
            border-radius: 10px;
            overflow: hidden;
            transition: all 0.3s;
            border: 1px solid #eee;
        }

        .movie-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
        }

        .movie-poster {
            height: 280px;
            overflow: hidden;
            position: relative;
        }

        .movie-poster img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: all 0.4s;
        }

        .movie-card:hover .movie-poster img {
            transform: scale(1.08);
        }

        .movie-info {
            padding: 18px;
        }

        .movie-info h3 {
            font-family: 'vazir-bold';
            font-size: 1.05rem;
            margin-bottom: 8px;
            color: #444;
        }

        .movie-genre, .movie-duration {
            display: block;
            font-size: 0.85rem;
            color: #777;
        }

        .movie-duration {
            margin-top: 6px;
        }

        .movie-actions {
            padding: 0 18px 18px;
            display: flex;
            gap: 10px;
            justify-content: flex-end;
        }

        .btn-edit, .btn-delete {
            width: 34px;
            height: 34px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: none;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-edit {
            background-color: var(--light-blue);
            color: white;
        }

        .btn-delete {
            background-color: var(--danger-color);
            color: white;
        }

        .btn-edit:hover, .btn-delete:hover {
            opacity: 0.9;
            transform: scale(1.05);
        }

        .screenings-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }

        .screenings-table th {
            padding: 15px;
            text-align: right;
            background-color: #f9f9f9;
            font-family: 'vazir-bold';
            color: #555;
            font-size: 0.95rem;
            border-bottom: 1px solid var(--seperator-color);
        }

        .screenings-table td {
            padding: 15px;
            text-align: right;
            border-bottom: 1px solid var(--seperator-color);
            font-size: 0.9rem;
            color: #555;
        }

        .screenings-table tr:last-child td {
            border-bottom: none;
        }

        .screenings-table tr:hover {
            background-color: rgba(212, 175, 55, 0.03);
        }

        .movie-cell {
            display: flex;
            align-items: center;
        }

        .movie-cell img {
            width: 45px;
            height: 45px;
            border-radius: 6px;
            object-fit: cover;
            margin-left: 12px;
        }

        .action-buttons {
            display: flex;
            justify-content: flex-end;
        }

        .btn-primary {
            background-color: var(--primary);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            font-family: 'vazir-medium';
            font-size: 0.9rem;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
        }

        .btn-primary:hover {
            background-color: #c19b2d;
            box-shadow: 0 3px 10px rgba(212, 175, 55, 0.3);
        }

        .btn-primary i {
            margin-left: 8px;
        }

        .tab-container {
            margin-bottom: 25px;
        }

        .tab-buttons {
            display: flex;
            border-bottom: 1px solid var(--seperator-color);
        }

        .tab-btn {
            padding: 12px 25px;
            background: none;
            border: none;
            border-bottom: 3px solid transparent;
            font-family: 'vazir-medium';
            color: #777;
            cursor: pointer;
            transition: all 0.3s;
            font-size: 0.95rem;
        }

        .tab-btn.active {
            color: var(--primary);
            border-bottom-color: var(--primary);
            font-family: 'vazir-bold';
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-family: 'vazir-medium';
            color: #555;
            font-size: 0.95rem;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--seperator-color);
            border-radius: 6px;
            font-family: 'vazir-medium';
            transition: all 0.3s;
            background-color: #f9f9f9;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            background-color: white;
            box-shadow: 0 0 0 3px rgba(212, 175, 55, 0.2);
        }

        .form-row {
            display: flex;
            gap: 20px;
        }

        .form-row .form-group {
            flex: 1;
        }


        .screen {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
            margin-bottom: 30px;
            border-radius: 4px;
            font-family: 'vazir-bold';
        }


        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1000;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s;
        }

        .modal-overlay.active {
            opacity: 1;
            visibility: visible;
        }

        .modal {
            background-color: white;
            border-radius: 12px;
            width: 90%;
            max-width: 600px;
            max-height: 90vh;
            overflow-y: auto;
            transform: translateY(20px);
            transition: all 0.3s ease-out;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        .modal-overlay.active .modal {
            transform: translateY(0);
            opacity: 1;
        }

        .modal-header {
            padding: 20px;
            border-bottom: 1px solid var(--seperator-color);
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: sticky;
            top: 0;
            background-color: white;
            z-index: 10;
            border-radius: 12px 12px 0 0;
        }

        .modal-header h3 {
            font-family: 'vazir-bold';
            margin: 0;
            color: #444;
            font-size: 1.3rem;
        }

        .modal-close {
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
            color: #999;
            transition: all 0.3s;
            padding: 5px;
            line-height: 1;
        }

        .modal-close:hover {
            color: var(--danger-color);
        }

        .modal-body {
            padding: 20px;
        }

        .modal-footer {
            padding: 15px 0;
            border-top: 1px solid var(--seperator-color);
            display: flex;
            justify-content: flex-start;
            gap: 10px;
            position: sticky;
            bottom: 0;
            background-color: white;
            border-radius: 0 0 12px 12px;
        }

        .modal .form-group {
            margin-bottom: 15px;
        }

        .modal .form-label {
            font-size: 0.9rem;
            margin-bottom: 6px;
        }

        .modal .form-control {
            padding: 10px 15px;
            font-size: 0.9rem;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 6px;
            font-family: 'vazir-medium';
            cursor: pointer;
            transition: all 0.3s;
            font-size: 0.9rem;
            border: 1px solid transparent;
            min-width: 100px;
            text-align: center;
        }

        .btn-primary {
            background-color: var(--primary);
            color: white;
        }

        .btn-primary:hover {
            background-color: #c19b2d;
            box-shadow: 0 3px 10px rgba(212, 175, 55, 0.3);
        }

        .btn-secondary {
            background-color: #f0f0f0;
            color: #555;
            border-color: #ddd;
        }

        .btn-secondary:hover {
            background-color: #e0e0e0;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes fadeOut {
            from {
                opacity: 1;
            }
            to {
                opacity: 0;
            }
        }

        .modal-overlay {
            animation: fadeIn 0.3s ease-out forwards;
        }

        .modal-overlay.closing {
            animation: fadeOut 0.3s ease-out forwards;
        }

        .modal-body::-webkit-scrollbar {
            width: 6px;
        }

        .modal-body::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 10px;
        }

        .modal-body::-webkit-scrollbar-thumb {
            background: #c1c1c1;
            border-radius: 10px;
        }

        .modal-body::-webkit-scrollbar-thumb:hover {
            background: #a8a8a8;
        }

        .form-control[type="file"] {
            padding: 8px;
            line-height: 1.5;
        }

        .form-control {
            appearance: none;
            background-repeat: no-repeat;
            background-position: left 15px center;
            background-size: 12px;
            padding-right: 15px;
        }

        @media (max-width: 1200px) {
            .sidebar {
                width: 240px;
            }

            .content-header {
                padding: 20px;
            }

            .content-body {
                padding: 20px;
            }

            .section-container {
                padding: 20px;
            }
        }

        @media (max-width: 992px) {
            .sidebar {
                width: 80px;
                overflow: hidden;
            }

            .logo h2, .user-info, .admin-nav a span {
                display: none;
            }

            .admin-nav a {
                justify-content: center;
                padding: 15px 0;
            }

            .admin-nav a i {
                margin-left: 0;
                font-size: 1.3rem;
            }

            .user-avatar {
                margin-left: 0;
            }

            .search-box input {
                width: 200px;
            }
        }

        @media (max-width: 768px) {
            .quick-stats {
                grid-template-columns: repeat(2, 1fr);
            }

            .content-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .header-actions {
                margin-top: 15px;
                width: 100%;
            }

            .search-box {
                flex: 1;
            }

            .search-box input {
                width: 100%;
            }

            .movies-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .form-row {
                flex-direction: column;
                gap: 0;
            }

            .modal {
                width: 95%;
                max-width: 95%;
            }
        }

        @media (max-width: 576px) {
            .quick-stats {
                grid-template-columns: 1fr;
            }

            .movies-grid {
                grid-template-columns: 1fr;
            }

            .screenings-table {
                display: block;
                overflow-x: auto;
            }

            .modal {
                width: 95%;
            }
        }


        .hall-card {
            background-color: var(--explicit-color);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            border: 1px solid #eee;
        }

        .hall-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .hall-card-header {
            padding: 15px 20px;
            background-color: #f9f9f9;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid var(--seperator-color);
        }

        .hall-card-header h3 {
            margin: 0;
            font-family: 'vazir-bold';
            color: #444;
            font-size: 1.1rem;
        }

        .hall-card-body {
            padding: 20px;
        }

        .hall-info div {
            margin-bottom: 10px;
            font-size: 0.9rem;
            color: #555;
        }

        .hall-info i {
            margin-left: 8px;
            color: var(--primary);
            width: 18px;
            text-align: center;
        }

        .hall-actions {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }

        .btn-view-layout {
            padding: 8px 15px;
            border-radius: 6px;
            background-color: var(--light-blue);
            color: white;
            border: none;
            cursor: pointer;
            transition: all 0.3s;
            font-family: 'vazir-medium';
            font-size: 0.85rem;
            flex: 1;
        }

        .btn-view-layout:hover {
            background-color: #2980b9;
        }

        .screen-area {
            text-align: center;
            margin-bottom: 30px;
            padding: 15px;
            background-color: #f9f9f9;
            border-radius: 8px;
        }

        .screen-label {
            font-family: 'vazir-bold';
            color: #555;
            margin-bottom: 15px;
            font-size: 1.1rem;
        }

        .screen {
            height: 15px;
            background: linear-gradient(to bottom, #555, #333);
            border-radius: 4px;
            margin: 0 auto;
            width: 80%;
            box-shadow: 0 3px 15px rgba(0, 0, 0, 0.3);
            position: relative;
        }

        .screen:after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 20%;
            width: 60%;
            height: 5px;
            background: linear-gradient(to bottom, rgba(255, 255, 255, 0.3), transparent);
            border-radius: 50%;
        }

        .seat {
            width: 35px;
            height: 35px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.2s ease;
            font-size: 0.85rem;
            font-family: 'vazir-medium';
            position: relative;
            user-select: none;
            background: linear-gradient(135deg, #f5f5f5, #e0e0e0);
            box-shadow: 0 3px 5px rgba(0, 0, 0, 0.1);
            margin: 5px auto;
            color: #555;
            border: 2px solid #ddd;
        }

        .seat:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
        }

        .seat:active {
            transform: scale(0.95);
        }

        .seat.selected {
            background: linear-gradient(135deg, #4CAF50, #2E7D32);
            color: white;
            border-color: #2E7D32;
        }

        .seat.disabled {
            background: linear-gradient(135deg, #e0e0e0, #bdbdbd);
            color: #999;
            border-color: #bdbdbd;
            cursor: not-allowed;
            opacity: 0.7;
        }


        .seat-number {
            position: absolute;
            bottom: -20px;
            left: 0;
            right: 0;
            text-align: center;
            font-size: 0.7rem;
            color: #777;
            font-family: 'vazir-medium';
        }

        .row-number {
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.8rem;
            color: #555;
            position: absolute;
            right: 0;
            top: 50%;
            transform: translateY(-50%);
            font-family: 'vazir-bold';
            margin-right: 10px;
        }

        .seat-row {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            position: relative;
        }

        .layout-legend {
            margin-top: 30px;
            display: flex;
            justify-content: center;
            gap: 25px;
            flex-wrap: wrap;
        }

        .legend-item {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 0.85rem;
            color: #555;
            background: #f5f5f5;
            padding: 8px 15px;
            border-radius: 20px;
        }

        .legend-color {
            width: 20px;
            height: 20px;
            border-radius: 5px;
            border: 1px solid rgba(0, 0, 0, 0.1);
        }

        .legend-color.available {
            background: linear-gradient(135deg, #f5f5f5, #e0e0e0);
        }

        .legend-color.selected {
            background: linear-gradient(135deg, #4CAF50, #2E7D32);
        }

        .legend-color.disabled {
            background: linear-gradient(135deg, #e0e0e0, #bdbdbd);
        }


        .seats-grid {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin: 0 auto;
            max-width: 800px;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        @keyframes seatPulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
            100% {
                transform: scale(1);
            }
        }

        .seat.selected {
            animation: seatPulse 1s ease infinite;
        }


        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .hall-card {
            animation: fadeIn 0.4s ease-out forwards;
        }

        #backToHallsList {
            background-color: #6c757d;
            color: white;
            border: none;
            border-radius: 6px;
            font-family: 'vazir-medium';
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px 15px;
        }

        #backToHallsList:hover {
            background-color: #5a6268;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        #saveLayoutBtn {
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: 6px;
            font-family: 'vazir-medium';
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px 15px;
        }

        #saveLayoutBtn:hover {
            background-color: #c19b2d;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }


        .layout-controls {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-bottom: 20px;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 8px;
        }

    </style>
</head>
<body>
<div class="admin-container">
    <aside class="sidebar">
        <div class="logo">
            <img src="logo.png" alt="سینماتیکت">
            <h2>سینماتیکت</h2>
        </div>

        <nav class="admin-nav">
            <ul>
                <li class="active"><a id="a-dashboard" href="${request.getContextPath()}/admin"><i
                        class="fas fa-tachometer-alt"></i> پیشخوان</a></li>
                <li><a id="a-films" href="${request.getContextPath()}/admin/films"><i class="fas fa-film"></i> مدیریت
                    فیلم‌ها</a></li>
                <li><a id="a-screenings" href="${request.getContextPath()}/admin/screenings"><i
                        class="fas fa-calendar-alt"></i> مدیریت سانس‌ها</a></li>
                <li><a id="a-halls" href="${request.getContextPath()}/admin/halls"><i class="fas fa-chair"></i> مدیریت
                    سالن‌ها</a></li>
                <li><a id="a-tickets" href="${request.getContextPath()}/admin/tickets"><i class="fas fa-ticket-alt"></i>
                    مدیریت بلیط‌ها</a></li>
                <li><a id="a-admins" href="${request.getContextPath()}/admin/admins"><i class="fas fa-users-cog"></i>
                    مدیریت ادمین‌ها</a></li>
            </ul>
        </nav>

        <div class="user-panel">
            <div class="user-avatar">
                <img src="user-avatar.jpg" alt="ادمین">
            </div>
            <div class="user-info">
                <span class="user-name">مدیر سیستم</span>
                <span class="user-role">سوپر ادمین</span>
            </div>
            <a href="#" class="logout-btn"><i class="fas fa-sign-out-alt"></i></a>
        </div>
    </aside>

    <main class="main-content">
        <header class="content-header">
            <h1>پیشخوان مدیریت</h1>
            <div class="header-actions">
                <div class="search-box">
                    <input type="text" placeholder="جستجو...">
                    <button><i class="fas fa-search"></i></button>
                </div>
                <div class="notifications">
                    <i class="fas fa-bell"></i>
                    <span class="badge">3</span>
                </div>
            </div>
        </header>

        <div class="content-body">
            <div id="dashboard" class="tab-content active">
                <div class="quick-stats">
                    <div class="stat-card">
                        <div class="stat-icon" style="background-color: var(--light-blue);">
                            <i class="fas fa-film"></i>
                        </div>
                        <div class="stat-info">
                            <span class="stat-title">فیلم‌های فعال</span>
                            <span class="stat-value">${films.size()}</span>
                        </div>
                    </div>

                    <div class="stat-card">
                        <div class="stat-icon" style="background-color: var(--primary);">
                            <i class="fas fa-calendar-day"></i>
                        </div>
                        <div class="stat-info">
                            <span class="stat-title">سانس امروز</span>
                            <span class="stat-value">0</span>
                        </div>
                    </div>

                    <div class="stat-card">
                        <div class="stat-icon" style="background-color: var(--success-color);">
                            <i class="fas fa-ticket-alt"></i>
                        </div>
                        <div class="stat-info">
                            <span class="stat-title">بلیط فروخته شده</span>
                            <span class="stat-value">0</span>
                        </div>
                    </div>

                    <div class="stat-card">
                        <div class="stat-icon" style="background-color: var(--danger-color);">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="stat-info">
                            <span class="stat-title">ادمین‌ها</span>
                            <span class="stat-value">1</span>
                        </div>
                    </div>
                </div>

                <div class="section-container">
                    <div class="section-header">
                        <h2>فیلم‌های اخیرا اضافه شده</h2>
                        <a href="admin/films" class="view-all">مشاهده همه <i class="fas fa-chevron-left"></i></a>
                    </div>

                    <div class="movies-grid">
                        <c:forEach items="${films}" var="film">
                            <div class="movie-card">
                                <div class="movie-poster">
                                    <img src="${request.getContextPath()}/${film.getPoster()}" alt="فیلم">
                                </div>
                                <div class="movie-info">
                                    <h3>${film.getFilmName()}</h3>
                                    <span class="movie-genre">درام, اکشن</span>
                                    <span class="movie-duration">${film.getTime()}</span>
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                </div>

                <div class="section-container">
                    <div class="section-header">
                        <h2>سانس‌های آینده</h2>
                        <a href="#screenings" class="view-all">مشاهده همه <i class="fas fa-chevron-left"></i></a>
                    </div>

                    <table class="screenings-table">
                        <thead>
                        <tr>
                            <th>فیلم</th>
                            <th>تاریخ</th>
                            <th>ساعت</th>
                            <th>سالن</th>
                            <th>قیمت</th>
                            <th>عملیات</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <div class="movie-cell">
                                    <img src="movie1.jpg" alt="فیلم">
                                    <span>عنوان فیلم</span>
                                </div>
                            </td>
                            <td>1402/05/15</td>
                            <td>18:30</td>
                            <td>سالن 1</td>
                            <td>50,000 تومان</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-edit"><i class="fas fa-edit"></i></button>
                                    <button class="btn-delete"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="movie-cell">
                                    <img src="movie2.jpg" alt="فیلم">
                                    <span>عنوان فیلم 2</span>
                                </div>
                            </td>
                            <td>1402/05/15</td>
                            <td>21:00</td>
                            <td>سالن 2</td>
                            <td>45,000 تومان</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-edit"><i class="fas fa-edit"></i></button>
                                    <button class="btn-delete"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="movie-cell">
                                    <img src="movie3.jpg" alt="فیلم">
                                    <span>عنوان فیلم 3</span>
                                </div>
                            </td>
                            <td>1402/05/16</td>
                            <td>16:00</td>
                            <td>سالن 3</td>
                            <td>55,000 تومان</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-edit"><i class="fas fa-edit"></i></button>
                                    <button class="btn-delete"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div id="films" class="tab-content">
                <div class="section-container">
                    <div class="section-header">
                        <h2>مدیریت فیلم‌ها</h2>
                        <button class="btn-primary" id="addMovieBtn"><i class="fas fa-plus"></i> افزودن فیلم جدید
                        </button>
                    </div>


                    <div class="movies-grid">
                        <c:forEach items="${films}" var="film">
                            <div class="movie-card">
                                <div class="movie-poster">
                                    <img src="${request.getContextPath()}/${film.getPoster()}" alt="فیلم">
                                </div>
                                <div class="movie-info">
                                    <h3>${film.getFilmName()}</h3>
                                    <span class="movie-genre">ژانر</span>
                                    <span class="movie-duration">${film.getTime()} دقیقه </span>
                                </div>
                                <div class="movie-actions">
                                    <button class="btn-edit"
                                            onclick="editFilm({ filmId : '${film.getFilmId()}' , filmName : '${film.getFilmName()}' , time: '${film.getTime()}' , year: '${film.getYear()}',
                                                    author:'${film.getAuthor()}' , actors: '${film.getActors()}' })"><i
                                            class="fas fa-edit"></i></button>
                                    <button class="btn-delete" onclick="deleteMovie('${film.getFilmId()}')"><i
                                            class="fas fa-trash"></i></button>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>

            <div id="screenings" class="tab-content">
                <div class="section-container">
                    <div class="section-header">
                        <h2>مدیریت سانس‌ها</h2>
                        <button class="btn-primary" id="addScreeningBtn"><i class="fas fa-plus"></i> افزودن سانس جدید
                        </button>
                    </div>

                    <table class="screenings-table">
                        <thead>
                        <tr>
                            <th>فیلم</th>
                            <th>تاریخ</th>
                            <th>ساعت</th>
                            <th>سالن</th>
                            <th>قیمت</th>
                            <th>صندلی‌های آزاد</th>
                            <th>عملیات</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <div class="movie-cell">
                                    <img src="movie1.jpg" alt="فیلم">
                                    <span>عنوان فیلم</span>
                                </div>
                            </td>
                            <td>1402/05/15</td>
                            <td>18:30</td>
                            <td>سالن 1</td>
                            <td>50,000 تومان</td>
                            <td>24</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-edit"><i class="fas fa-edit"></i></button>
                                    <button class="btn-delete"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="movie-cell">
                                    <img src="movie2.jpg" alt="فیلم">
                                    <span>عنوان فیلم 2</span>
                                </div>
                            </td>
                            <td>1402/05/15</td>
                            <td>21:00</td>
                            <td>سالن 2</td>
                            <td>45,000 تومان</td>
                            <td>12</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-edit"><i class="fas fa-edit"></i></button>
                                    <button class="btn-delete"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="movie-cell">
                                    <img src="movie3.jpg" alt="فیلم">
                                    <span>عنوان فیلم 3</span>
                                </div>
                            </td>
                            <td>1402/05/16</td>
                            <td>16:00</td>
                            <td>سالن 3</td>
                            <td>55,000 تومان</td>
                            <td>36</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-edit"><i class="fas fa-edit"></i></button>
                                    <button class="btn-delete"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="movie-cell">
                                    <img src="movie4.jpg" alt="فیلم">
                                    <span>عنوان فیلم 4</span>
                                </div>
                            </td>
                            <td>1402/05/16</td>
                            <td>19:30</td>
                            <td>سالن 1</td>
                            <td>60,000 تومان</td>
                            <td>8</td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-edit"><i class="fas fa-edit"></i></button>
                                    <button class="btn-delete"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div id="halls" class="tab-content">
                <div class="section-container">

                    <div class="halls-header">
                        <div class="section-header">
                            <h2>مدیریت سالن‌ها</h2>
                            <button class="btn-primary" id="addHallBtn"><i class="fas fa-plus"></i> افزودن سالن جدید
                            </button>
                        </div>
                    </div>

                    <div class="halls-grid"
                         style="display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 20px; margin-bottom: 30px;">
                        <c:forEach items="${halls}" var="hall">
                            <div class="hall-card">
                                <div class="hall-card-header">
                                    <h3>${hall.getHallName()}</h3>
                                </div>
                                <div class="hall-card-body">
                                    <div class="hall-info">
                                        <div><i class="fas fa-chair"></i> ظرفیت:
                                            <strong>${hall.getEachRow() * hall.getMaxRow()} صندلی</strong></div>
                                        <div><i class="fas fa-border-all"></i> چیدمان: <strong>${hall.getMaxRow()} ردیف
                                            × ${hall.getEachRow()} صندلی</strong></div>
                                    </div>
                                    <div class="hall-actions">
                                        <button class="btn-delete" onclick="deleteHall(${hall.getHallId()})"><i
                                                class="fas fa-trash"></i></button>
                                        <button class="btn-edit" onclick="editHall({
                                                hallId : '${hall.getHallId()}',
                                                hallName: '${hall.getHallName()}',
                                                hallDescription: '${hall.getDescription()}',
                                                eachRow:'${hall.getEachRow()}',
                                                maxRow:'${hall.getMaxRow()}'
                                                })"><i class="fas fa-edit"></i></button>
                                        <button class="btn-view-layout"
                                                onclick="viewHallLayout(${hall.getHallId()} , ${hall.getEachRow()} , ${hall.getMaxRow()})">
                                            <i class="fas fa-th-large"></i> مدیریت صندلی‌ها
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>


                    <div class="hall-layout-container" id="hallLayoutContainer" style="display: none;">
                        <div class="section-header" style="padding: 0; margin-bottom: 20px;">
                            <div style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
                                <h2 id="currentHallTitle">مدیریت صندلی‌های سالن ۱</h2>
                                <div style="display: flex; gap: 10px;">
                                    <button class="btn-secondary" id="backToHallsList"
                                            style="padding: 10px 15px; display: flex; align-items: center;">
                                        <i class="fas fa-arrow-right" style="margin-left: 8px;"></i> بازگشت به لیست
                                    </button>
                                    <button class="btn-primary" id="saveLayoutBtn"
                                            style="padding: 10px 15px; display: flex; align-items: center;">
                                        <i class="fas fa-save" style="margin-left: 8px;"></i> ذخیره تغییرات
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="hall-layout-preview">
                            <div class="screen-area">
                                <div class="screen-label">صفحه نمایش</div>
                                <div class="screen"></div>
                            </div>

                            <div class="seats-grid" id="seatsGrid"></div>
                        </div>

                        <div class="layout-legend">
                            <div class="legend-item">
                                <div class="legend-color available"></div>
                                <span>صندلی فعال</span>
                            </div>
                            <div class="legend-item">
                                <div class="legend-color disabled"></div>
                                <span>غیرفعال</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div id="tickets" class="tab-content">
                <div class="section-container">
                    <div class="section-header">
                        <h2>مدیریت بلیط‌ها</h2>
                    </div>

                    <div class="tab-container">
                        <div class="tab-buttons">
                            <button class="tab-btn active">همه بلیط‌ها</button>
                            <button class="tab-btn">فروخته شده</button>
                            <button class="tab-btn">رزرو شده</button>
                            <button class="tab-btn">لغو شده</button>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">جستجوی بلیط</label>
                            <input type="text" class="form-control" placeholder="کد بلیط یا نام خریدار...">
                        </div>
                        <div class="form-group">
                            <label class="form-label">تاریخ</label>
                            <input type="date" class="form-control">
                        </div>
                    </div>

                    <table class="screenings-table">
                        <thead>
                        <tr>
                            <th>کد بلیط</th>
                            <th>فیلم</th>
                            <th>سانس</th>
                            <th>خریدار</th>
                            <th>تاریخ خرید</th>
                            <th>قیمت</th>
                            <th>وضعیت</th>
                            <th>عملیات</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>TK-1254</td>
                            <td>
                                <div class="movie-cell">
                                    <img src="movie1.jpg" alt="فیلم">
                                    <span>عنوان فیلم</span>
                                </div>
                            </td>
                            <td>
                                <div>1402/05/15</div>
                                <div>18:30 - سالن 1</div>
                            </td>
                            <td>محمد رضایی</td>
                            <td>1402/05/10</td>
                            <td>50,000 تومان</td>
                            <td><span style="color: var(--success-color);">فروخته شده</span></td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-edit"><i class="fas fa-eye"></i></button>
                                    <button class="btn-delete"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>TK-1253</td>
                            <td>
                                <div class="movie-cell">
                                    <img src="movie2.jpg" alt="فیلم">
                                    <span>عنوان فیلم 2</span>
                                </div>
                            </td>
                            <td>
                                <div>1402/05/15</div>
                                <div>21:00 - سالن 2</div>
                            </td>
                            <td>فاطمه محمدی</td>
                            <td>1402/05/09</td>
                            <td>45,000 تومان</td>
                            <td><span style="color: var(--success-color);">فروخته شده</span></td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-edit"><i class="fas fa-eye"></i></button>
                                    <button class="btn-delete"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>TK-1252</td>
                            <td>
                                <div class="movie-cell">
                                    <img src="movie3.jpg" alt="فیلم">
                                    <span>عنوان فیلم 3</span>
                                </div>
                            </td>
                            <td>
                                <div>1402/05/16</div>
                                <div>16:00 - سالن 3</div>
                            </td>
                            <td>علی حسینی</td>
                            <td>1402/05/08</td>
                            <td>55,000 تومان</td>
                            <td><span style="color: #f39c12;">رزرو شده</span></td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-edit"><i class="fas fa-eye"></i></button>
                                    <button class="btn-delete"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>TK-1251</td>
                            <td>
                                <div class="movie-cell">
                                    <img src="movie4.jpg" alt="فیلم">
                                    <span>عنوان فیلم 4</span>
                                </div>
                            </td>
                            <td>
                                <div>1402/05/16</div>
                                <div>19:30 - سالن 1</div>
                            </td>
                            <td>زهرا کریمی</td>
                            <td>1402/05/07</td>
                            <td>60,000 تومان</td>
                            <td><span style="color: var(--danger-color);">لغو شده</span></td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-edit"><i class="fas fa-eye"></i></button>
                                    <button class="btn-delete"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div id="admins" class="tab-content">
                <div class="section-container">
                    <div class="section-header">
                        <h2>مدیریت ادمین‌ها</h2>
                        <button class="btn-primary" id="addAdminBtn"><i class="fas fa-plus"></i> افزودن ادمین جدید
                        </button>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">جستجوی ادمین</label>
                            <input type="text" class="form-control" placeholder="نام یا ایمیل ادمین...">
                        </div>
                    </div>

                    <table class="screenings-table">
                        <thead>
                        <tr>
                            <th>نام</th>
                            <th>ایمیل</th>
                            <th>نقش</th>
                            <th>تاریخ عضویت</th>
                            <th>وضعیت</th>
                            <th>عملیات</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <div class="movie-cell">
                                    <img src="admin1.jpg" alt="ادمین" style="border-radius: 50%;">
                                    <span>مدیر سیستم</span>
                                </div>
                            </td>
                            <td>admin@cinematicket.com</td>
                            <td>سوپر ادمین</td>
                            <td>1401/03/15</td>
                            <td><span style="color: var(--success-color);">فعال</span></td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-edit"><i class="fas fa-edit"></i></button>
                                    <button class="btn-delete"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="movie-cell">
                                    <img src="admin2.jpg" alt="ادمین" style="border-radius: 50%;">
                                    <span>محمد رضایی</span>
                                </div>
                            </td>
                            <td>m.rezaei@cinematicket.com</td>
                            <td>مدیر محتوا</td>
                            <td>1401/08/20</td>
                            <td><span style="color: var(--success-color);">فعال</span></td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-edit"><i class="fas fa-edit"></i></button>
                                    <button class="btn-delete"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="movie-cell">
                                    <img src="admin3.jpg" alt="ادمین" style="border-radius: 50%;">
                                    <span>فاطمه محمدی</span>
                                </div>
                            </td>
                            <td>f.mohammadi@cinematicket.com</td>
                            <td>اپراتور</td>
                            <td>1402/01/10</td>
                            <td><span style="color: var(--success-color);">فعال</span></td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-edit"><i class="fas fa-edit"></i></button>
                                    <button class="btn-delete"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="movie-cell">
                                    <img src="admin4.jpg" alt="ادمین" style="border-radius: 50%;">
                                    <span>علی حسینی</span>
                                </div>
                            </td>
                            <td>a.hosseini@cinematicket.com</td>
                            <td>اپراتور</td>
                            <td>1402/04/05</td>
                            <td><span style="color: var(--danger-color);">غیرفعال</span></td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-edit"><i class="fas fa-edit"></i></button>
                                    <button class="btn-delete"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
</div>


<div class="modal-overlay" id="addMovieModal">
    <div class="modal">
        <div class="modal-header">
            <h3>افزودن فیلم جدید</h3>
            <button class="modal-close">&times;</button>
        </div>
        <form class="modal-body" id="filmForm"
              enctype="multipart/form-data">
            <div class="form-group">
                <label class="form-label" for="filmName">عنوان فیلم</label>
                <input type="text" name="filmName" id="filmName" class="form-control"
                       placeholder="عنوان فیلم را وارد کنید" required>
            </div>
            <div class="form-group">
                <label class="form-label" for="genre">ژانر</label>
                <input type="text" class="form-control" name="genre" id="genre" placeholder="ژانرهای فیلم را وارد کنید"
                       required>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label class="form-label" for="time">مدت زمان (دقیقه)</label>
                    <input type="number" name="time" id="time" class="form-control" placeholder="مدت زمان فیلم"
                           required>
                </div>
                <div class="form-group">
                    <label class="form-label" for="year">سال تولید</label>
                    <input type="number" class="form-control" name="year" id="year" placeholder="سال تولید فیلم"
                           required>
                </div>
            </div>
            <div class="form-group">
                <label class="form-label" for="author">کارگردان</label>
                <input type="text" class="form-control" name="author" id="author" placeholder="نام کارگردان" required>
            </div>
            <div class="form-group">
                <label class="form-label" for="actors">بازیگران</label>
                <input type="text" class="form-control" name="actors" id="actors"
                       placeholder="نام بازیگران (با کاما جدا کنید)" required>
            </div>
            <div class="form-group">
                <label class="form-label" for="poster">پوستر فیلم</label>
                <input type="file" class="form-control" name="poster" id="poster" accept="image/*">
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary modal-close" type="button">انصراف</button>
                <button class="btn btn-primary" type="button" onclick="newMovie()">ذخیره فیلم</button>
            </div>
        </form>
    </div>
</div>

<div class="modal-overlay" id="addScreeningModal">
    <div class="modal">
        <div class="modal-header">
            <h3>افزودن سانس جدید</h3>
            <button class="modal-close">&times;</button>
        </div>
        <div class="modal-body">
            <div class="form-group">
                <label class="form-label">فیلم</label>
                <select class="form-control" required>
                    <option value="">انتخاب فیلم</option>
                    <option value="1">عنوان فیلم</option>
                    <option value="2">عنوان فیلم 2</option>
                    <option value="3">عنوان فیلم 3</option>
                    <option value="4">عنوان فیلم 4</option>
                </select>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <label class="form-label">تاریخ</label>
                    <input type="date" class="form-control" required>
                </div>
                <div class="form-group">
                    <label class="form-label">ساعت</label>
                    <input type="time" class="form-control" required>
                </div>
            </div>
            <div class="form-group">
                <label class="form-label">سالن</label>
                <select class="form-control" required>
                    <option value="">انتخاب سالن</option>
                    <option value="1">سالن 1</option>
                    <option value="2">سالن 2</option>
                    <option value="3">سالن 3</option>
                </select>
            </div>
            <div class="form-group">
                <label class="form-label">قیمت بلیط (تومان)</label>
                <input type="number" class="form-control" placeholder="قیمت بلیط را وارد کنید" required>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-secondary modal-close">انصراف</button>
            <button class="btn btn-primary">ذخیره سانس</button>
        </div>
    </div>
</div>
<div class="modal-overlay" id="addHallModal">
    <div class="modal" style="max-width: 600px;">
        <div class="modal-header">
            <h3 id="hallModalTitle">افزودن سالن جدید</h3>
            <button class="modal-close">&times;</button>
        </div>
        <form class="modal-body" id="hallForm" enctype="multipart/form-data">
            <div class="form-group">
                <label class="form-label" for="hallName">نام سالن</label>
                <input type="text" class="form-control" name="hallName" id="hallName" placeholder="مثال: سالن ۱"
                       required>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label class="form-label" for="maxRow">تعداد ردیف</label>
                    <input type="number" class="form-control" id="maxRow" name="maxRow" required>
                </div>
                <div class="form-group">
                    <label class="form-label" for="eachRow">تعداد صندلی در هر ردیف</label>
                    <input type="number" class="form-control" id="eachRow" name="eachRow" required>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label" for="hallDescription">توضیحات (اختیاری)</label>
                <textarea class="form-control" id="hallDescription" name="hallDescription" rows="3"
                          placeholder="توضیحات درباره سالن..."></textarea>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary modal-close" type="button">انصراف</button>
                <button class="btn btn-primary" type="button" id="saveHallBtn" onclick="newHall()">ذخیره سالن</button>
            </div>
        </form>
    </div>
</div>


<div class="modal-overlay" id="addAdminModal">
    <div class="modal">
        <div class="modal-header">
            <h3>افزودن ادمین جدید</h3>
            <button class="modal-close">&times;</button>
        </div>
        <div class="modal-body">
            <div class="form-row">
                <div class="form-group">
                    <label class="form-label">نام</label>
                    <input type="text" class="form-control" placeholder="نام ادمین" required>
                </div>
                <div class="form-group">
                    <label class="form-label">نام خانوادگی</label>
                    <input type="text" class="form-control" placeholder="نام خانوادگی ادمین" required>
                </div>
            </div>
            <div class="form-group">
                <label class="form-label">ایمیل</label>
                <input type="email" class="form-control" placeholder="ایمیل ادمین" required>
            </div>
            <div class="form-group">
                <label class="form-label">رمز عبور</label>
                <input type="password" class="form-control" placeholder="رمز عبور" required>
            </div>
            <div class="form-group">
                <label class="form-label">تکرار رمز عبور</label>
                <input type="password" class="form-control" placeholder="تکرار رمز عبور" required>
            </div>
            <div class="form-group">
                <label class="form-label">نقش</label>
                <select class="form-control" required>
                    <option value="">انتخاب نقش</option>
                    <option value="superadmin">سوپر ادمین</option>
                    <option value="content">مدیر محتوا</option>
                    <option value="operator">اپراتور</option>
                </select>
            </div>
            <div class="form-group">
                <label class="form-label">تصویر پروفایل</label>
                <input type="file" class="form-control" accept="image/*">
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-secondary modal-close">انصراف</button>
            <button class="btn btn-primary">ذخیره ادمین</button>
        </div>
    </div>
</div>

<script>

    let filmTmp = null
    let hallTmp = null


    const detectPageFromURL = () => {
        const path = window.location.pathname;


        if (path === '/admin' || path === '/admin/') {
            return 'dashboard';
        }

        const parts = path.split('/');
        if (parts[1] === 'admin' && parts[2]) {
            return parts[2];
        }


        return 'dashboard';
    }

    const showPage = (pageId) => {
        document.querySelectorAll('.tab-content').forEach(page => {
            page.style.display = 'none';
        });

        const requestedPage = document.getElementById(pageId);
        if (requestedPage) {
            requestedPage.style.display = 'block';
        } else {

            document.getElementById('dashboard').style.display = 'block';
        }


        document.querySelectorAll('.admin-nav li').forEach(item => {
            item.classList.remove('active');
        });
        const activeNavItem = document.getElementById("a-" + pageId);

        if (activeNavItem) {
            activeNavItem.parentElement.classList.add('active');
        }
    }

    const currentPage = detectPageFromURL();
    showPage(currentPage);

    document.querySelectorAll('.admin-nav a').forEach(link => {
        link.addEventListener('click', function (e) {
            const pageId = this.getAttribute('href').split('/').pop() || 'dashboard';
            window.history.pushState({}, '', `/admin/${pageId == 'dashboard' ? '' : pageId}`);
            showPage(pageId);
        });
    });

    window.addEventListener('popstate', function () {
        const newPage = detectPageFromURL();
        showPage(newPage);
    });

    const modals = {
        addMovieModal: {
            openBtn: document.getElementById('addMovieBtn'),
            modal: document.getElementById('addMovieModal')
        },
        addScreeningModal: {
            openBtn: document.getElementById('addScreeningBtn'),
            modal: document.getElementById('addScreeningModal')
        },
        addHallModal: {
            openBtn: document.getElementById('addHallBtn'),
            modal: document.getElementById('addHallModal')
        },
        addAdminModal: {
            openBtn: document.getElementById('addAdminBtn'),
            modal: document.getElementById('addAdminModal')
        }
    };


    Object.values(modals).forEach(({openBtn, modal}) => {
        if (openBtn && modal) {
            openBtn.addEventListener('click', () => {
                filmTmp = null
                hallTmp = null
                fillInputs(document.getElementById("filmForm"), null)
                modal.classList.add('active');
                document.body.style.overflow = 'hidden';
            });
        }
    });

    document.querySelectorAll('.modal-overlay, .modal-close').forEach(el => {
        el.addEventListener('click', function (e) {
            if (e.target === this || e.target.classList.contains('modal-close')) {
                const modal = this.closest('.modal-overlay') || this;
                modal.classList.add('closing');
                document.body.style.overflow = '';
                modal.classList.remove('active', 'closing');
            }
        });
    });

    document.querySelectorAll('.modal').forEach(modal => {
        modal.addEventListener('click', function (e) {
            e.stopPropagation();
        });
    });


    const editFilm = (film) => {
        filmTmp = film
        document.body.style.overflow = 'hidden';
        modals.addMovieModal.modal.classList.add("active")
        fillInputs(document.getElementById("filmForm"), film)
    }
    const fillInputs = (form, item) => {
        const formArray = Array.from(form.elements)

        if (formArray.length > 0) {
            formArray.forEach((i) => {
                if (i.tagName === "INPUT") {
                    if (item === null) {
                        i.value = ""
                    } else {
                        i.value = item[i.name] !== undefined ? item[i.name] : ""
                    }
                }
            })
        }
    }

    const deleteMovie = (id) => {
        const formData = new FormData()
        formData.append("filmId", id)
        fetch("/admin/films/delete", {
            method: "POST",
            body: formData
        })
            .then((res) => {
                if (res.redirected) {
                    window.location.href = res.url
                }
            })
    }


    const newMovie = () => {
        const formData = new FormData(document.getElementById("filmForm"))

        if (filmTmp !== null) {
            formData.append("filmId", filmTmp.filmId)
        }


        fetch("/admin/films/insert", {
            method: "POST",
            body: formData
        })
            .then((res) => {
                if (res.redirected) {
                    window.location.href = res.url
                }
            })
    }


    document.querySelectorAll('.tab-buttons .tab-btn').forEach(btn => {
        btn.addEventListener('click', function () {
            document.querySelectorAll('.tab-buttons .tab-btn').forEach(b => b.classList.remove('active'));
            this.classList.add('active');

            const filter = this.dataset.filter;
            document.querySelectorAll('.hall-card').forEach(card => {
                if (filter === 'all' || card.dataset.status === filter || card.dataset.type === filter) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    });


    const viewHallLayout = (hallId, seatsPerRow, rows) => {

        document.querySelector('.halls-header').style.display = 'none';
        document.querySelector('.halls-grid').style.display = 'none';
        document.getElementById('hallLayoutContainer').style.display = 'block';
        document.getElementById('currentHallTitle').textContent = `مدیریت صندلی‌های سالن ${hallId}`;

        const seatsGrid = document.getElementById('seatsGrid');
        seatsGrid.innerHTML = '';

        for (let row = 1; row <= rows; row++) {
            const rowContainer = document.createElement('div');
            rowContainer.className = 'seat-row';

            const rowNumber = document.createElement('div');
            rowNumber.className = 'row-number';
            rowNumber.textContent = row;
            rowContainer.appendChild(rowNumber);

            for (let seatNum = 1; seatNum <= seatsPerRow; seatNum++) {
                const seat = document.createElement('div');
                seat.className = 'seat';
                seat.dataset.row = row;
                seat.dataset.seat = seatNum;
                seat.dataset.hallId = hallId;

                const seatNumber = document.createElement('div');
                seatNumber.className = 'seat-number';
                seatNumber.textContent = seatNum;

                seat.innerHTML = `<i class="fas fa-chair"></i>`;
                seat.appendChild(seatNumber);

                seat.addEventListener('click', function () {
                    this.classList.toggle('disabled');
                });

                rowContainer.appendChild(seat);
            }
            seatsGrid.appendChild(rowContainer);
        }
    };

    document.getElementById('backToHallsList').addEventListener('click', function () {
        // نمایش دوباره هدر و دکمه افزودن سالن
        document.querySelector('.halls-header').style.display = 'block';
        document.querySelector('.halls-grid').style.display = 'grid';
        document.getElementById('hallLayoutContainer').style.display = 'none';
    });
    document.getElementById('backToHallsList').addEventListener('click', function () {
        document.querySelector('.halls-grid').style.display = 'grid';
        document.getElementById('hallLayoutContainer').style.display = 'none';
    });


    document.getElementById('saveLayoutBtn').addEventListener('click', function () {
        alert('تغییرات صندلی‌ها با موفقیت ذخیره شد.');
    });


    const editHall = (hall) => {
        hallTmp = hall
        document.body.style.overflow = 'hidden';
        modals.addHallModal.modal.classList.add("active")
        fillInputs(document.getElementById("hallForm"), hall)
    }

    const newHall = () => {
        const formData = new FormData(document.getElementById("hallForm"))
        if (hallTmp !== null) {
            formData.append("hallId", hallTmp.hallId)
        }
        const chairs = []
        for (let i = 1; i <= parseInt(formData.get("maxRow")); i++) {
            for (let j = 1; j <= parseInt(formData.get("eachRow")); j++) {
                chairs.push({
                    chairId: null,
                    chairNumber: j,
                    rowNumber: i,
                })
            }
        }
        chairs.forEach((chair, index) => {
            formData.append("chairs[" + index + "][chairNumber]", chair.chairNumber);
            formData.append("chairs[" + index + "][rowNumber]", chair.rowNumber);
        });

        fetch("/admin/halls/insert", {
            method: "POST",
            body: formData
        })
            .then((res) => {
                if (res.redirected) {
                }
            })
    }

    const deleteHall = (id) => {
        const formData = new FormData()
        formData.append("hallId", id)
        fetch("/admin/halls/delete", {
            method: "POST",
            body: formData
        })
            .then((res) => {
                if (res.redirected) {
                    window.location.href = res.url
                }
            })
    }

</script>
</body>
</html>
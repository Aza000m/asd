<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Система управления пользователями">
    <meta name="author" content="Ваше Имя">
    <title>Пользователи</title>
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,600,700,800,900" rel="stylesheet">
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Nunito', sans-serif;
        }
        .form-control-custom {
            border-radius: 0.375rem;
            box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.125);
            max-width: 150px;
            width: 100%;
            padding: 0.5rem;
        }
        .btn-custom {
            border-radius: 0.375rem;
            font-size: 0.875rem;
        }
        .form-group {
            margin-bottom: 0.5rem;
        }
        .table thead th {
            background-color: #f8f9fc;
            font-weight: bold;
        }
        .table tbody tr:hover {
            background-color: #f1f1f1;
        }
        .table-responsive {
            overflow-x: auto;
        }
        .table td, .table th {
            white-space: nowrap;
        }
        .actions-buttons {
            text-align: center;
        }
        #wrapper {
            display: flex;
        }
        #sidebarToggle {
            margin-top: 1rem;
        }
        #filterForm {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }
        #filterForm .form-control, #filterForm .btn {
            border-radius: 0.375rem;
        }
        #filterForm .form-control-sm {
            max-width: 150px;
            width: 100%;
            padding: 0.5rem;
        }
        #filterForm .btn-sm {
            border-radius: 0.375rem;
        }
    </style>
</head>
<body>
    <div id="wrapper">
        <!-- Боковое меню -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.php">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Nanny</div>
            </a>
            <div class="sidebar-heading">Tables</div>
            <li class="nav-item" id="users">
                <a class="nav-link" href="index.php">
                    <i class="fas fa-fw fa-users"></i>
                    <span>Users</span>
                </a>
            </li>
            <li class="nav-item" id="admins">
                <a class="nav-link" href="admins.php">
                    <i class="fas fa-fw fa-user-shield"></i>
                    <span>Admins</span>
                </a>
            </li>
            <hr class="sidebar-divider">
            <li class="nav-item">
                <a class="nav-link" href="logout.php">
                    <i class="fas fa-fw fa-sign-out-alt"></i>
                    <span>Logout</span>
                </a>
            </li>
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
        </ul>

        <!-- Контент -->
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <div class="container-fluid">
                    <!-- Панель фильтрации -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Фильтрация пользователей</h6>
                        </div>
                        <div class="card-body">
                            <form id="filterForm" class="form-inline">
                                <div class="form-group mr-2">
                                    <input type="text" class="form-control form-control-sm" id="filterName" placeholder="Имя">
                                </div>
                                <div class="form-group mr-2">
                                    <input type="text" class="form-control form-control-sm" id="filterPhone" placeholder="Телефон">
                                </div>
                                <div class="form-group mr-2">
                                    <input type="text" class="form-control form-control-sm" id="filterMaritalStatus" placeholder="Семейное положение">
                                </div>
                                <div class="form-group mr-2">
                                    <input type="number" class="form-control form-control-sm" id="filterAge" placeholder="Возраст">
                                </div>
                                <div class="form-group mr-2">
                                    <input type="number" class="form-control form-control-sm" id="filterNumChildren" placeholder="Количество детей">
                                </div>
                                <div class="form-group mr-2">
                                    <input type="number" class="form-control form-control-sm" id="filterExperienceYears" placeholder="Стаж работы">
                                </div>
                                <div class="form-group mr-2">
                                    <input type="text" class="form-control form-control-sm" id="filterCar" placeholder="Автомобиль">
                                </div>
                                <div class="form-group mr-2">
                                    <input type="text" class="form-control form-control-sm" id="filterUaeDriverLicense" placeholder="Водительское удостоверение">
                                </div>
                                <div class="form-group mr-2">
                                    <input type="text" class="form-control form-control-sm" id="filterMonthlySalary" placeholder="Месячная зарплата">
                                </div>
                                <div class="form-group mr-2">
                                    <input type="text" class="form-control form-control-sm" id="filterHourlySalary" placeholder="Часовая ставка">
                                </div>
                                <button type="button" class="btn btn-primary btn-sm" id="applyFilterBtn">Применить</button>
                            </form>
                        </div>
                    </div>
                    <!-- Таблица пользователей -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Таблица пользователей</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="user-table" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Имя</th>
                                            <th>Фамилия</th>
                                            <th>Возраст</th>
                                            <th>Семейное положение</th>
                                            <th>Количество детей</th>
                                            <th>Телефон</th>
                                            <th>Фото</th>
                                            <th>Стаж работы</th>
                                            <th>Место жительства</th>
                                            <th>Языки</th>
                                            <th>Водительское удостоверение ОАЭ</th>
                                            <th>Автомобиль</th>
                                            <th>Месячная зарплата</th>
                                            <th>Часовая ставка</th>
                                            <th>Дополнительная информация</th>
                                            <th>Telegram ID</th>
                                            <th>Имя пользователя в Telegram</th>
                                            <th>Действия</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        include 'config.php'; 
                                        $sql = "SELECT id, first_name, last_name, age, marital_status, num_children, phone_number, photo, experience_years, accommodation, languages, uae_driver_license, car, monthly_salary, hourly_salary, about, telegram_id, telegram_username FROM nannies";
                                        $result = $conn->query($sql);
                                        if ($result->num_rows > 0) {
                                            while ($row = $result->fetch_assoc()) {
                                                echo "<tr>";
                                                echo "<td>" . $row["id"] . "</td>";
                                                echo "<td>" . $row["first_name"] . "</td>";
                                                echo "<td>" . $row["last_name"] . "</td>";
                                                echo "<td>" . $row["age"] . "</td>";
                                                echo "<td>" . $row["marital_status"] . "</td>";
                                                echo "<td>" . $row["num_children"] . "</td>";
                                                echo "<td>" . $row["phone_number"] . "</td>";
                                                echo "<td><img src='" . $row["photo"] . "' alt='Фото' style='width: 50px; height: auto;'></td>";
                                                echo "<td>" . $row["experience_years"] . "</td>";
                                                echo "<td>" . $row["accommodation"] . "</td>";
                                                echo "<td>" . $row["languages"] . "</td>";
                                                echo "<td>" . $row["uae_driver_license"] . "</td>";
                                                echo "<td>" . $row["car"] . "</td>";
                                                echo "<td>" . $row["monthly_salary"] . "</td>";
                                                echo "<td>" . $row["hourly_salary"] . "</td>";
                                                echo "<td>" . $row["about"] . "</td>";
                                                echo "<td>" . $row["telegram_id"] . "</td>";
                                                echo "<td>" . $row["telegram_username"] . "</td>";
                                                echo "<td class='actions-buttons'>";
                                                echo "<button class='btn btn-warning btn-sm' data-toggle='modal' data-target='#editModal' data-id='" . $row["id"] . "'>Редактировать</button>";
                                                echo "<a href='delete.php?id=" . $row["id"] . "' class='btn btn-danger btn-sm'>Удалить</a>";
                                                echo "</td>";
                                                echo "</tr>";
                                            }
                                        } else {
                                            echo "<tr><td colspan='19'>Нет данных</td></tr>";
                                        }
                                        $conn->close();
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Footer -->
            <footer class="footer">
                <div class="container my-auto">
                    <div class="text-center my-auto">
                        <span>Создано с &hearts; для вашего удобства</span>
                    </div>
                </div>
            </footer>
        </div>
    </div>
<!-- Modals -->
<!-- Edit Modal -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Редактирование пользователя</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editForm" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="id" id="editId">
                    <div class="form-group">
                        <label for="editFirstName">Имя</label>
                        <input type="text" class="form-control" id="editFirstName" name="first_name">
                    </div>
                    <div class="form-group">
                        <label for="editLastName">Фамилия</label>
                        <input type="text" class="form-control" id="editLastName" name="last_name">
                    </div>
                    <div class="form-group">
                        <label for="editAge">Возраст</label>
                        <input type="number" class="form-control" id="editAge" name="age">
                    </div>
                    <div class="form-group">
                        <label for="editMaritalStatus">Семейное положение</label>
                        <input type="text" class="form-control" id="editMaritalStatus" name="marital_status">
                    </div>
                    <div class="form-group">
                        <label for="editNumChildren">Количество детей</label>
                        <input type="number" class="form-control" id="editNumChildren" name="num_children">
                    </div>
                    <div class="form-group">
                        <label for="editPhoneNumber">Телефон</label>
                        <input type="text" class="form-control" id="editPhoneNumber" name="phone_number">
                    </div>
                    <div class="form-group">
                        <label for="editPhoto">Фото</label>
                        <input type="file" class="form-control-file" id="editPhoto" name="photo">
                        <img id="editPhotoPreview" style="width: 100px; height: auto;" />
                    </div>
                    <div class="form-group">
                        <label for="editExperienceYears">Стаж работы</label>
                        <input type="number" class="form-control" id="editExperienceYears" name="experience_years">
                    </div>
                    <div class="form-group">
                        <label for="editAccommodation">Место жительства</label>
                        <input type="text" class="form-control" id="editAccommodation" name="accommodation">
                    </div>
                    <div class="form-group">
                        <label for="editLanguages">Языки</label>
                        <input type="text" class="form-control" id="editLanguages" name="languages">
                    </div>
                    <div class="form-group">
                        <label for="editUaeDriverLicense">Водительское удостоверение ОАЭ</label>
                        <input type="text" class="form-control" id="editUaeDriverLicense" name="uae_driver_license">
                    </div>
                    <div class="form-group">
                        <label for="editCar">Автомобиль</label>
                        <input type="text" class="form-control" id="editCar" name="car">
                    </div>
                    <div class="form-group">
                        <label for="editMonthlySalary">Месячная зарплата</label>
                        <input type="text" class="form-control" id="editMonthlySalary" name="monthly_salary">
                    </div>
                    <div class="form-group">
                        <label for="editHourlySalary">Часовая ставка</label>
                        <input type="text" class="form-control" id="editHourlySalary" name="hourly_salary">
                    </div>
                    <div class="form-group">
                        <label for="editAbout">Доп. информация</label>
                        <textarea class="form-control" id="editAbout" name="about"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="editTelegramId">Telegram ID</label>
                        <input type="text" class="form-control" id="editTelegramId" name="telegram_id">
                    </div>
                    <div class="form-group">
                        <label for="editTelegramUsername">Telegram Username</label>
                        <input type="text" class="form-control" id="editTelegramUsername" name="telegram_username">
                    </div>
                    <button type="submit" class="btn btn-primary">Сохранить изменения</button>
                </form>
            </div>
        </div>
    </div>
</div>

    <!-- JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="js/sb-admin-2.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#user-table').DataTable();

            // Обработчик нажатия на кнопку "Редактировать"
            $('#user-table').on('click', '.btn-warning', function() {
                var id = $(this).data('id');

                // Отправляем AJAX запрос на сервер для получения данных пользователя по ID
                $.ajax({
                    url: 'get_user.php', // Этот скрипт должен вернуть данные пользователя по ID в формате JSON
                    method: 'GET',
                    data: { id: id },
                    dataType: 'json',
                    success: function(data) {
                        // Заполняем поля формы модального окна полученными данными
                        $('#editId').val(data.id);
                        $('#editFirstName').val(data.first_name);
                        $('#editLastName').val(data.last_name);
                        $('#editAge').val(data.age);
                        $('#editMaritalStatus').val(data.marital_status);
                        $('#editNumChildren').val(data.num_children);
                        $('#editPhoneNumber').val(data.phone_number);
                        $('#editExperienceYears').val(data.experience_years);
                        $('#editAccommodation').val(data.accommodation);
                        $('#editLanguages').val(data.languages);
                        $('#editUaeDriverLicense').val(data.uae_driver_license);
                        $('#editCar').val(data.car);
                        $('#editMonthlySalary').val(data.monthly_salary);
                        $('#editHourlySalary').val(data.hourly_salary);
                        $('#editAbout').val(data.about);
                        $('#editTelegramId').val(data.telegram_id);
                        $('#editTelegramUsername').val(data.telegram_username);
                        
                        // Если фото уже есть, показываем превью
                        if(data.photo) {
                            $('#editPhotoPreview').attr('src', data.photo).show();
                        } else {
                            $('#editPhotoPreview').hide();
                        }
                    }
                });
            });
        });

        $('#applyFilterBtn').on('click', function() {
            let name = $('#filterName').val();
            let phone = $('#filterPhone').val();
            let maritalStatus = $('#filterMaritalStatus').val();
            let age = $('#filterAge').val();
            let numChildren = $('#filterNumChildren').val();
            let experienceYears = $('#filterExperienceYears').val();
            let car = $('#filterCar').val();
            let uaeDriverLicense = $('#filterUaeDriverLicense').val();
            let monthlySalary = $('#filterMonthlySalary').val();
            let hourlySalary = $('#filterHourlySalary').val();
            
            // AJAX запрос для применения фильтров
            $.ajax({
                url: 'filter.php',
                method: 'GET',
                data: {
                    name: name,
                    phone: phone,
                    maritalStatus: maritalStatus,
                    age: age,
                    numChildren: numChildren,
                    experienceYears: experienceYears,
                    car: car,
                    uaeDriverLicense: uaeDriverLicense,
                    monthlySalary: monthlySalary,
                    hourlySalary: hourlySalary
                },
                success: function(data) {
                    $('#user-table').DataTable().clear().destroy();
                    $('#user-table tbody').html(data);
                    $('#user-table').DataTable();
                }
            });
        });
    </script>
</body>
</html>

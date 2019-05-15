<%@ page contentType="text/html;charset=UTF-8" %>
<html ng-app="partslistApp">
<head>
    <title>Parts List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mystyles.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
          crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
    <style type="text/css">
        TH {
            background: Thistle; /* Цвет фона ячеек */
            padding: 7px; /* Поля вокруг текста */
        }
    </style>
</head>
<body style="background-color: WhiteSmoke" ng-controller="partsController">
<div class="container-fluid">
    <div class="row">
        <div class="col-8 center">
            <h1>Компьютерные запчасти</h1>
            <div class="search">
                <div class="container">
                    <div class="row">
                        <div class="col-8 offset-2">
                            <div class="input-group">
                                <input class="form-control" style="background-color:#E0FFFF;color:black" type="text" placeholder="Наименование"
                                       ng-model="searchText"/>
                                <div class="input-group-append" id="button-addon4">
                                    <button class="btn btn-primary"  ng-click="searchForName()">Поиск</button>
                                    <button class="btn btn-secondary" ng-click="clearSearchText()">Отменить</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="filters">
                <p><label><input type="radio" name="filter" ng-model="required" value="" ng-click="filter(required)"/>Все</label>
                <label><input type="radio" name="filter" ng-model="required" value="true" ng-click="filter(required)"/>Необходимые</label>
                <label><input type="radio" name="filter" ng-model="required" value="false" ng-click="filter(required)"/>Опциональные</label></p>
            </div>
            <div class="content">
                <table style="background-color:#E0FFFF;color:black" class="table table-sm table-striped table-bordered">
                    <thead>
                    <tr>
                        <th>Наименование </th>
                        <th>Необходимость</th>
                        <th>Количество</th>
                        <th colspan="2">Действия</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat="part in partsList.parts" ng-include="getTemplate(part)">
                    </tr>
                    </tbody>

                    <script type="text/ng-template" id="display">
                        <td>{{part.name}}</td>
                        <td>{{part.required}}</td>
                        <td>{{part.amount}}</td>
                        <td>
                            <button class="btn btn-success" style="background-color:PaleGreen;color:black" ng-click="editPart(part)">Изменить</button>
                        </td>
                        <td>
                            <button class="btn btn-danger" style="background-color:LightCoral;color:black" ng-click="deletePart(part)">Удалить</button>
                        </td>
                    </script>

                    <script type="text/ng-template" id="edit">
                        <td><input class="form-control" type="text" ng-model="selectedPart.name" required/></td>
                        <td><input type="checkbox" ng-model="selectedPart.required" required/></td>
                        <td><input class="form-control" type="number" min="0" max="1000" required
                                   ng-model="selectedPart.amount"/></td>
                        <td>
                            <button class="btn btn-success" style="background-color:PaleGreen;color:black" ng-click="savePart(part)">Сохранить</button>
                        </td>
                        <td>
                            <button class="btn btn-warning" style="background-color:DarkOrange;color:black" ng-click="reset()">Отменить</button>
                        </td>
                    </script>
                </table>
                <p><label></label></p>
                <div class="footer">
                    <button class="btn btn-info" ng-click="prevPage()"> Предыдущая </button>
                    <button class="btn btn-info" ng-click="nextPage()">Следующая</button>
                </div>
            </div>
        </div>
        <div class="col right">
            <div class="container">
                <div class="row">
                    <div class="col-8">
                        <div class="input-group">
                            <form name="addForm">
                                <h5>Добавить на склад</h5>
                                <p><input class="form-control" style="background-color:#E0FFFF;color:black" type="text" ng-model="newPart.name" required
                                          placeholder="Наименование"/></p>
                                <p><input class="form-control" style="background-color:#E0FFFF;color:black" type="number" min="0" max="1000"
                                          ng-model="newPart.amount" required placeholder="Количество"/>
                                </p>
                                <p><label>Необходимость<input type="checkbox" ng-model="newPart.required"/></label></p>
                                <button type="submit" class="btn btn-primary" ng-click="addPart(addForm)">
                                    Добавить
                                </button>
                            </form>
                            <p>Компьютеров готово к сборке: <span ng-bind="partsList.canAssemblyComps">{{partsList.canAssemblyComps}}</span></p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>

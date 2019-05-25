<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <meta charset="utf-8" />
        <style>
            table {
              font-family: arial, sans-serif;
              border-collapse: collapse;
              width: 100%;
            }

            td, th {
              border: 1px solid #dddddd;
              text-align: left;
              padding: 8px;
            }

            tr:nth-child(even) {
              background-color: #dddddd;
            }
        </style>
        <script src="Scripts/jquery-3.4.1.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var toSend = $("#send");
                // post
                $("#btn2").click(function () {
                    var inputData = $("#tnum")
                    $.ajax({
                        type: "POST",
                        url: "https://jsonplaceholder.typicode.com/posts",
                        data: inputData,
                        dataType: "json",
                        success: function (data) {
                            toSend.empty();
                            toSend.append(data.id);
                        }
                    });
                });

                // get
                $("#btn1").click(function () {
                    $.ajax({
                        type: "GET",
                        url: "https://jsonplaceholder.typicode.com/posts",
                        dataType: "json",
                        success: function (data) {
                            toSend.empty();
                            for (i in data) {
                                var id = data[i].id;
                                var title = data[i].title;
                                var body = data[i].body;
                                if (i == 0) {
                                    id = "<b>ID</b>";
                                    title = "<b>Title</b>";
                                    body = "<b>Body</b>";
                                }
                                toSend.append("<tr><td>" + id + "</td><td>" + title + "</td><td>" + body + "</td></tr>")
                            }
                            toSend.append("</table>");
                        }
                    });
                });

                $("#btnClear").click(function () {
                    toSend.empty();
                });
            });
        </script>
    </div>

    <div class="jumbotron">
        <h1>UPS API</h1>
        <p class="lead">Posts to the api with the input form</p>
        <p><form action="/action_page.php">
            Tracking Number: <input type="text" name="tnum" id="tnum"><br>
            <input id="btn1" type="button" value="Get from Api">
            <input id="btn2" type="button" value="Post To Api">
            <%--<input id="btn3" type="button" value="Put To Api">--%>
        </form></p>
        <p><input id="btnClear" type="button" value="Clear" /></p>
        <div id ="send"></div>
    </div>

    <%--<div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>--%>

</asp:Content>

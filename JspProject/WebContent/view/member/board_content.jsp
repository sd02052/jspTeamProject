<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>board_content</title>
        <link rel="stylesheet" href="<%=request.getContextPath() %>/style/style.css">
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        <style type="text/css">
            .table-bordered {
                padding: 5px 10px;
            }

            .label1 {
                background-color: #bbb;
            }

            .h {
                margin: 3px 0px;
            }

            .padding {
                padding: 1.8px 5.4px 2.7px;
            }

            .font {
                font-size: 12px;
            }

            .font1 {
                font-size: 10px;
            }

            .font_style {
                font-weight: bold;
            }

            .box {
                width: 400px;
                height: 40px;
            }

            .size {
                width: 803px;
                height: 53px;
            }

            .img {
                width: 14px;
                height: 14px;
            }

            .li1 {
                font-size: 13px;
                color: gray;
            }

            .pa {
                padding: 20px;
            }

            .a1 {
                font-size: 12px;
            }

            .li2 {
                font-size: 3px;
                color: gray;
            }

            .font2 {
                font-size: 3px;
                color: gray;
            }

            .span {
                font-size: 14px;
            }

            .img1 {
                padding-top: 12px;
            }

            .a2 {
                padding-top: 12px;
            }

            .right {
                float: right;
            }

            .live {
                font-size: 14px;
            }

            .btn2 {
                color: gray;
                align: center;
                display: inline-block;
                font-size: 25px;
            }

            .div1 {
                text-align: center;
            }
        </style>

    </head>

    <body>
        <div class="layout_container">
            <div class="main">
                <jsp:include page="../../include/side.jsp" />
                <!-- 본문 시작-->
                <div style="width: 805px; min-height: 800px;">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="row">
                                <div class="col-xs-12 col-md-8">
                                    <h4>커뮤니티</h4>
                                </div>
                                <div class="col-xs-12 col-md-4">
                                    <button type="button" class="btn btn-success" style="float: right;">
                                        <i class="fas fa-pencil-alt"></i>새 글 쓰기
                                    </button>
                                </div>
                            </div>
                            <br>
                            <div class="col-xs-12" style="border: 1px solid gray;">
                                <ul class="list-inline">
                                    <li class="list-unstyled li1 right"><a class="li1"> <i
                                                class="fas fa-comment img"></i> 11
                                        </a></li>
                                    <li class="list-unstyled li1 right"><a class="li1"> <i class="far fa-eye"></i> 6k
                                        </a></li>

                                    <li class="list-unstyled li1  img1"></li>
                                    <a class="avatar-photo text-left"> <img width="30" height="30" class="img-circle "
                                            src="//www.gravatar.com/avatar/b66da5ef6099211f5db8f5f7a3b4c36b?d=identicon&s=30">
                                    </a>
                                    </li>
                                    <li class="list-unstyled li1 a2">
                                        <div class="text-left">
                                            <span class="list-group-item-text article-id font">#953490</span><i
                                                class="fas fa-bolt i1"></i>
                                            2k
                                            <p class="span">2021-05-27 09:27:16</p>
                                        </div>
                                    </li>
                                </ul>
                            </div>


                            <div class="col-xs-10" style="border: 1px solid gray; padding: 15px;">
                                <span class="list-group-item-text article-id live">#953490</span>
                                <a class="list-group-item-text item-tag label label-info padding">
                                    <i class="fas fa-comment"></i> 사는얘기
                                </a>

                                <h2 style="font-size: 22px;">가나다라마바사</h2>
                                <hr width="90%" color="gray">

                                <p>가나다라마바사</p>
                                <p>아자차카파타하</p>
                                <p>abcdefg</p>
                                <p>hijklmn</p>
                                <p>opqrstu</p>
                                <p>vwxyz</p>
                            </div>

                            <div class="col-xs-2 div1" style="border: 1px solid gray;">
                                <br> <br> <br>
                                <button type="button" class="btn btn-link btn2">
                                    <i class="fas fa-angle-up"></i>
                                </button>
                                <br>
                                <p style="font-size: 20px;">0</p>

                                <button type="button" class="btn btn-link btn2">
                                    <i class="fas fa-angle-down"></i></i>
                                </button>

                                <br>


                                <button type="button" class="btn btn-link btn2" data-toggle="tooltip"
                                    data-placement="left" title="스크랩">
                                    <i class="fas fa-bookmark"></i>
                                </button>
                                <br> <br> <br> <br>

                            </div>


                        </div>

                        <br> <br>

                        <div class="row" style="border: 1px solid;">
                            <div class="col-xs-12"
                                style="border: 1px solid gray; background-color: #f2f2f2; border-left: honeydew; border-top: honeydew; border-right: honeydew;">
                                <h4>댓글&nbsp;&nbsp;<span>0</span></h4>
                            </div>

                            <div class="col-xs-10" style="margin: 0px 0px 0px 0px; padding: 0px 0px 0px 0px;">
                                <ul class="list-inline">
                                    <li class="list-unstyled li1  img1"></li>
                                    <a class="avatar-photo text-left"> <img width="30" height="30" class="img-circle "
                                            src="//www.gravatar.com/avatar/b66da5ef6099211f5db8f5f7a3b4c36b?d=identicon&s=30">
                                    </a>
                                    </li>
                                    <li class="list-unstyled li1 a2">
                                        <div class="text-left">
                                            <p style="margin-bottom : 0;">가나다라마바</p>
                                            <span class="list-group-item-text article-id font">#953490</span><i
                                                class="fas fa-bolt i1"></i>
                                            2k
                                        </div>
                                    </li>
                                </ul>
                                <div class="row">
                                    <div class="col-sm-8 "
                                        style=" padding: 0px 0px 0px 10px; margin: 0px 0px 0px 10px;">
                                        <textarea class="form-control noresize" rows="5"></textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xs-2"
                                style="border: 1px solid gray; background-color: #ffffff; border-bottom: honeydew; border-top: honeydew; border-right: honeydew;">
                                <br> <br> <br> <br> <br> <br> <br>
                                <button type="button" class="btn btn-success" style="position: static;">
                                    <i class="fas fa-pencil-alt"></i>등록
                                </button>
                            </div>
                        </div>
                        <!-- 본문 끝-->

                        <jsp:include page="../../include/footer.jsp" />
                    </div>
                </div>
            </div>
        </div>
    </body>

    </html>
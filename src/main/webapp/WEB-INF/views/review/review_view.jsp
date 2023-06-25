<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review Edit</title>
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- jQuery library -->
    <script
            src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
    <!-- Popper JS -->
    <script
            src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <style>
        #content {
            overflow-y: scroll;
            -ms-overflow-style: none; /* 인터넷 익스플로러 */
            scrollbar-width: none; /* 파이어폭스 */
        }
        #content::-webkit-scrollbar {
            display: none; /* 크롬, 사파리, 오페라, 엣지 */
        }

        .div{
            width: 40%;
            margin: 40px auto;
            position:relative;
            border: none;
        }
        .div img{
            position: absolute;
            top:40%;
            left:50%;
            width:20%;
            transform: translate(-50%, -50%);

        }
        .div span{
            position: absolute;
            top:40%;
            left:50%;
            width:10%;
            transform: translate(-50%, -50%);
            text-align: center;
        }
        .link{
            font-size: 14px;
        }


    </style>
</head>
<body>
<div class="row">

    <div align="center" id="bbs" class="col-md-8 offset-md-2 my-4">
        <h2>Review view</h2>
        <p>
            <a href="#" onclick="edit()">글수정</a>| <a href = "#" onclick="goList()">글목록</a>
        <p>

        <form name="bf" id="bf" role="form">
            <!-- hidden data---------------------------------  -->
            <input type="hidden" name="review_id" id ="review_id" value="${vo.review_id}"/>


            <!-- 원본글쓰기: mode=> write
                 답변글쓰기: mode=> rewrite
                  글수정  : mode=> edit
             -->
            <!-- -------------------------------------------- -->
            <table class="table">
                <tr>
                    <td style="width:20%"><b>제목</b></td>
                    <td style="width:80%">
                        <input type="text" name="review_title" id="review_title" class="form-control" value="${vo.review_title}" readonly>
                    </td>

                </tr>
                <tr>
                    <td style="width:20%"><b>작성자</b></td>
                    <td style="width:80%">
                        <input type="hidden" name="user_id" id="user_id" value="${vo.user_id}" readonly />
                        <input type="text" name="user_name" id="user_name" value="${vo.user_name}" readonly />
                    </td>
                </tr>

                <tr>
                    <td style="width:20%"><b>글내용</b></td>
                    <td style="width:80%; border-bottom-style: hidden ">
                        <textarea name="review_content" id="review_content" rows="10" cols="50" class="form-control" readonly >${vo.review_content} </textarea>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" style="border-bottom-style: hidden">
                        <div onclick="com()"width="100px" height="100px"  class="div">
                            <img class="img" src="/image/re.png"/>
                            <input type="hidden" class="img_text" name="review_recommends" id="review_recommends" value="${vo.review_recommends}" readonly />
                            <span>${vo.review_recommends} </span>
                        </div>
                    </td>

                </tr>
            </table>
        </form>

    </div><!-- .col end-->

    <div class="row">
        <div align="center" id="bbs1" class="col-md-8 offset-md-2 my-4">
            <form>
                <table class="table table table-hover">
                    <tr>
                        <td colspan="2">
                            <b>댓글()</b> &nbsp;
                            <a href="#" class="link">등록순</a>
                            <a href="#" class="link">최신순</a>
                        </td>

                    </tr>
                    <tr>
                        <td width="90%" height="100px">
                            <textarea id="content" style="width: 100%; height: 100%;" name="content"></textarea>

                        </td>
                        <td width="10%"><input type="button" onclick="insertComment()" class="d-flex align-items-center flex-shrink-0 p-2 link-dark text-decoration-none " style="background-color: #12bbad; padding: 5px; margin-top: 25%;" value="등록"/></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

    <div id="comment_list" align="center" id="b" class="col-md-8 offset-md-2 my-4" />

</div><!-- .row end-->
<form method="get" action="list" name="reset" id="reset"></form>
</body>
<script>
    const edit = function(){
        bf.method='post';
        bf.action='edit'
        bf.submit();
    }

    const goList = function (){
        reset.submit();
    }

    const com = function(){
        alert("추천하였습니다.");
        bf.method='post';
        bf.action='view';
        bf.submit();
    }

    const deleteComment = function(id){
        $.ajax({
            type:'post',
            url:'/review/deleteComment',
            dataType:'text',
            data:{"id":id},
            cache:false,
        }).done((res)=>{
            alert("삭제되었습니다.")
            init();
        }).fail((err)=>{
            alert(err.status)
        })
    }

    const insertComment = function(){
        let rid=$('#review_id').val();
        let con=$('#content').val();
        let uid=$('#user_id').val();

        let jsonData={
            review_id:rid,
            content:con,
            user_id:uid
        };

        $.ajax({
            type:'post',
            url:'/review/insert',
            dataType:'text',
            contentType:'application/json; charset=UTF-8',
            data:JSON.stringify(jsonData),
            cache: false
        }).done((res)=>{
            alert("정상적으로 삽입되었습니다.")
            init();
        }).fail((err)=>{
            alert(err.status)
        })
    }

    const showComment = function(res){
        let str = "<table id='table1' style='width: 100%'>"

        $.each(res,(i,vo)=>{
            str+='<tr>';

            str+='<td width="10%">';
            str+=res[i].user_name;
            str+='</td>';

            str+='<td width="50%">';
            str+=res[i].content;
            str+='</td>';

            str+='<td width=15%>';
            str+=res[i].create_date;
            str+='</td>';

            str+='<td width=15%>';
            str+=res[i].update_date;
            str+='</td>';
            str+='<td width="10%">';
            str+='<input type="button" value="삭제" onclick="deleteComment(this.id)" id="'+res[i].comment_id+'"/>';
            str+='</td>';
            str+='</tr>';

        })
        str+='</table>';

        $('#comment_list').html(str);
    }

    const init = function(){
        let rid = $('#review_id').val();
        //alert(rid);
        $.ajax({
            type:'get',
            url:'/review/comment',
            data:{"review_id":rid},
            dataType:'json',
            cache:false
        }).done((res)=>{
            //alert('댓글 조회 확인');
            //alert(JSON.stringify(res));
            showComment(res);
        }).fail((err)=>{
            alert(err.status);
        })
    }


    $(()=>{
        init();}
    )

</script>
</html>
  $(function(){
            $(".item_list").css("opacity",0);
            $(".item_list").stop().fadeOut();

            $(".category").mouseover(function(){
                $(".item_list").stop().css({
                    "opacity":1,
                    "position":"relative",
                    "zIndex":333
                });
//                var idx = $(this).index(); 
                $(".item_list").stop().fadeIn();
            })
            $(".item_list").mouseleave(function(){
                 $(".item_list").stop().fadeOut();
            })
            $("#title").mouseover(function(){
                $(".item_list").stop().fadeOut();
            })
          
            var index=0;//현재 indicator
            function moveScreen(num){
                $(".indicator_list").removeClass("active");
                $(".indicator_list").eq(num).addClass("active");
                $(".backgound_list").removeClass("active");
                $(".backgound_list").eq(num).addClass("active");
                index = num;
            }
          
            $(".indicator_list").click(function(){
                var idx = $(this).index();
                moveScreen(idx);
            });
            $(".fa-arrow-left").click(function(){
                if(index<=0){return;}
                moveScreen(index-1); 
            })
             $(".fa-arrow-right").click(function(){
                if(index>=3){return;}
                
                moveScreen(index+1); 
            })
            $(window).scroll(function(){
                var top = $(window).scrollTop();
                if(top > 260){
                    $("header").addClass('active');
                    $("nav").addClass('active');
                    $(".move").css("display","inline-block")
                    $(".category_left_btn").css("display","none");
                    
                }else{
                    $("header").removeClass('active');
                    $("nav").removeClass('active');
                     $(".move").css("display","");
                    $(".category_left_btn").css("display","");
                }
                
            })//scroll event
            var scrollHeight= $(document).height();
            $('.move .top').click(function(){
                $("html,body").stop().animate({
                    scrollTop:0
                },400)
            });
             $('.move .bot').click(function(){
                $("html,body").stop().animate({
                    scrollTop:scrollHeight
                },400)
            });
            $(".category_left_btn").click(function(){
                $(".item_list").stop().fadeOut();
                  $('html').css("overflow","hidden");
                $(".btnAction").addClass('active');
                
            })//btn click event
           $(".cencle").click(function(){
               $(".btnAction").removeClass('active');
               $('html').css("overflow","");
           })
        })//end;
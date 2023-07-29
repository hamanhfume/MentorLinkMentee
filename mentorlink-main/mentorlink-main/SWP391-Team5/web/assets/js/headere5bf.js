//Auto active menu
$(document).ready(function () {
  $('[data-toggle="tooltip"]').tooltip();
  $('[rel="tooltip"]').tooltip({ trigger: "hover" });
  $("#fields_id").select2({
    width: 300,
  });
  $("#topic_id").select2({
    width: 220,
  });
  $("#list_experiences").select2({});
  $("#number_exps").select2({});
});

function start_rating() {
  $(".review_ratting").rating({
    starCaptions: { 0: "Chưa đánh giá", 1: "Rất tệ", 2: "Tệ", 3: "Tốt", 4: "Hài lòng", 5: "Rất hài lòng" },
    starCaptionClasses: {
      0: "text-danger",
      1: "text-danger",
      2: "text-warning",
      3: "text-info",
      4: "text-primary",
      5: "text-success"
    },
    hoverChangeCaption: false,
    clearButton: '',
    clearCaption: 'Chưa đánh giá',
  });
}

$('[data-toggle="tooltip"]').tooltip({
  trigger: "hover",
});

$(document).mouseup(function (e) {
  var container = $("#select_user_box");

  // if the target of the click isn't the container nor a descendant of the container
  if (!container.is(e.target) && container.has(e.target).length === 0) {
    container.hide();
  }
});

var current_url = location.href;
$('a[href="' + current_url + '"]')
  .parents("li")
  .addClass("current");

// $('.select_user_toggle').off('click').on('click', function (e) {
//     $('.select_user_box').toggleClass('select_user_box_show');
//     e.stopPropagation();
//     e.preventDefault();
// });

toastr.options.closeButton = true;

function ajax_user_pair(id) {
  $("#top-cart").toggleClass("top-cart-open", false);
  $.ajax({
    url: "/ajax/confirm-pair-mentee",
    method: "POST",
    data: {
      id: parseInt(id),
    },
    success: function (data) {
      $("#load_connect_content").html("");
      $("#load_connect_content").html(data);
      load_icheck();
      $("#modal_connect").modal("show");
    },
  });
}

$(".js-modal-top-appointment-list").on("shown.bs.modal", function () {
  $(".model-appointment-list").addClass("hidden-modal");
});

$(".js-modal-top-appointment-list").on("hidden.bs.modal", function () {
  $(".model-appointment-list").removeClass("hidden-modal");
});

function ajax_get_pair_details(id) {
  $.ajax({
    url: "/ajax/get-pair-details",
    method: "POST",
    data: {
      id: parseInt(id),
    },
    success: function (data) {
      $("#load_connect_content_details").html("");
      $("#load_connect_content_details").html(data);
      load_icheck();
      $("#modal_connect_details").modal("show");
    },
  });
}

function ajax_get_modal_review(bok_id) {
  $.ajax({
    url: "/ajax/get-modal-review",
    method: "POST",
    data: {
      bok_id: parseInt(bok_id),
    },
    success: function (data) {
      $("#no-review .modal-content").html("");
      $("#no-review .modal-content").html(data);
      start_rating();
      $("#no-review").modal("show");
      $('input[type=radio][name=review-type]').change(function () {
        if (this.value == 'review-1') {
          $('#review-type-1').removeClass("d-none");
          $('#review-type-2').addClass("d-none");
        } else if (this.value == 'review-2') {
          $('#review-type-2').removeClass("d-none");
          $('#review-type-1').addClass("d-none");

        }
      });

      $('input[type=radio][name=reason-type]').change(function () {
        $('.item-field-radio').removeClass('item-field-radio-selected');
        $(this).next().addClass("item-field-radio-selected");
      });

      $(".item-exp-txt").on("click", function () {
        $('#no-review textarea[name=content]').val(this.innerHTML);
        this.remove();
      });
    },
  });
}

function ajax_get_appointment_detail(id) {
  $.ajax({
    url: "/ajax/get-appointment-detail",
    method: "POST",
    data: {
      id: parseInt(id),
    },
    success: function (data) {
      $("#load_connect_content_details").html("");
      $("#load_connect_content_details").html(data);
      load_icheck();
      $("#modal_connect_details").modal("show");
    },
  });
}

function load_tooltip() {
  $('[data-toggle="tooltip"]').tooltip({ container: "body" });
}

function load_icheck() {
  $(".form-check-input").iCheck({
    checkboxClass: "icheckbox_square-green",
    radioClass: "iradio_square-green",
    increaseArea: "15%", // optional
  });
  $(".form-check-input").on("ifChecked", function (event) {
    // $(this).parent().parent().css('color', 'green');
    $("#field_child_" + $(this).val())
      .removeClass("hide")
      .addClass("show");
  });
  $(".form-check-input").on("ifUnchecked", function (event) {
    // $(this).parent().parent().css('color', '#DD4B39');
    $("#field_child_" + $(this).val())
      .removeClass("show")
      .addClass("hide");
    $(".field_type_2").iCheck("uncheck");
  });
  $(".appointment_type").on("ifChecked", function (event) {
    // $(this).parent().parent().css('color', 'green');
    $(this)
      .parent()
      .parent()
      .parent()
      .find(".appointment_div")
      .removeClass("d-none");
    $(this)
      .parent()
      .parent()
      .parent()
      .find(".appointment_input")
      .removeAttr("disabled");
    $(this).parent().parent().parent().find(".appointment_input").focus();
    // alert($(this).parent().parent().parent().find('.appointment_input').val())
  });
  $(".appointment_type").on("ifUnchecked", function (event) {
    // $(this).parent().parent().css('color', '#DD4B39');
    $(this)
      .parent()
      .parent()
      .parent()
      .find(".appointment_div")
      .addClass("d-none");
    $(this)
      .parent()
      .parent()
      .parent()
      .find(".appointment_input")
      .attr("disabled", "disabled");
    //        alert($(this).parent().parent().css('color','green'))
  });

  $("#appointment_chuan_bi_2").on("ifChecked", function (event) {
    $("#appointment_chuan_bi_other").removeClass("d-none");
    $("#appointment_chuan_bi_other").removeAttr("disabled");
    $("#appointment_chuan_bi_other").focus();
  });
  $("#appointment_chuan_bi_2").on("ifUnchecked", function (event) {
    $("#appointment_chuan_bi_other").addClass("d-none");
    $("#appointment_chuan_bi_other").addClass("disabled");
  });
  $(".appointment_chuan_bi_2").on("ifChecked", function (event) {
    $(".appointment_chuan_bi_other").removeClass("d-none");
    $(".appointment_chuan_bi_other").removeAttr("disabled");
    $(".appointment_chuan_bi_other").focus();
  });
  $(".appointment_chuan_bi_2").on("ifUnchecked", function (event) {
    $(".appointment_chuan_bi_other").addClass("d-none");
    $(".appointment_chuan_bi_other").addClass("disabled");
  });

  $(".radio_reason_refuse").on("ifChecked", function (event) {
    if ($(this).val() == 0) {
      $(".reason_refuse_content").removeClass("d-none");
    }
  });
  $(".radio_reason_refuse").on("ifUnchecked", function (event) {
    if ($(this).val() == 0) {
      $(".reason_refuse_content").addClass("d-none");
    }
  });
  $(".radio_reason").on("ifChecked", function (event) {
    if ($(this).val() == 0) {
      $(".reason_content").removeClass("d-none");
    }
  });
  $(".radio_reason").on("ifUnchecked", function (event) {
    if ($(this).val() == 0) {
      $(".reason_content").addClass("d-none");
    }
  });
}

function ajax_open_decline(id) {
  $(".reason_refuse_content").val("");
  $("#modal_reply_" + id).modal("hide");
  $("#top-cart").toggleClass("top-cart-open", false);
  // $("#modal_connect").on('hidden.bs.modal', function () {
  load_icheck();
  $("#modal_tu_choi_ket_noi").modal("show");
  $("#modal_tu_choi_ket_noi #btnRefuse").attr(
    "onclick",
    "ajax_decline_appointment(" + id + ");"
  );
  // });
}

function ajax_open_update_decline(id) {
  $(".reason_refuse_content").val("");
  $("#modal_reply_" + id).modal("hide");
  $("#top-cart").toggleClass("top-cart-open", false);
  // $("#modal_connect").on('hidden.bs.modal', function () {
  load_icheck();
  $("#modal_decline_update_appointment").modal("show");
  $("#modal_decline_update_appointment #btnRefuseUpdate").attr(
    "onclick",
    "ajax_decline_update_appointment(" + id + ");"
  );
  // });
}

function ajax_decline_update_appointment(id) {
  event.preventDefault();
  id = parseInt(id);
  // var _html = "#user_pair_connect_" + id;
  // var _html_accept = "#refuse_or_accept_" + id;
  // var _html_accept_rq = "#request_refuse_or_accept_" + id;

  // reason_refuse = $("input[name=reason_refuse]:checked").val();

  // if (reason_refuse == 0) {
  const ly_do_khac = $(".reason_refuse_content_update").val();
  if (ly_do_khac.length == 0) {
    toastr.error("Hãy nhập lý do hủy !!!");
    return false;
  }
  reason_refuse = ly_do_khac;
  // }

  $.ajax({
    url: "/ajax/decline-update-appointment",
    method: "POST",
    data: {
      bok_id: parseInt(id),
      reason_refuse: reason_refuse,
    },
    success: function (data) {
      setTimeout(function () {
        // $("#load_connect_content").html("");
        // $("#modal_connect").modal("hide");
        $("#modal_decline_update_appointment").modal("hide");
        toastr.success("Đã từ chối đề xuất đổi lịch thành công.");
        // $(_html_accept).html(
        //   '<button class="btn btn_refuse">Đã từ chối</button>'
        // );
        // $(_html_accept_rq).html(
        //   '<button class="btn btn_refuse">Đã từ chối</button>'
        // );
        location.reload();
      }, 200);
    },
  });
  return false;
}

function ajax_decline_appointment(id) {
  event.preventDefault();
  id = parseInt(id);
  // var _html = "#user_pair_connect_" + id;
  // var _html_accept = "#refuse_or_accept_" + id;
  // var _html_accept_rq = "#request_refuse_or_accept_" + id;

  reason_refuse = $("input[name=reason_refuse]:checked").val();

  if (reason_refuse == 0) {
    const ly_do_khac = $(".reason_refuse_content").val();
    if (ly_do_khac.length == 0) {
      toastr.error("Hãy nhập lý do hủy !!!");
      return false;
    }
    reason_refuse = ly_do_khac;
  }

  $.ajax({
    url: "/ajax/decline-appointment",
    method: "POST",
    data: {
      bok_id: parseInt(id),
      reason_refuse: reason_refuse,
    },
    success: function (data) {
      setTimeout(function () {
        // $("#load_connect_content").html("");
        // $("#modal_connect").modal("hide");
        $("#modal_tu_choi_ket_noi").modal("hide");
        toastr.success("Từ chối kết nối thành công");
        // $(_html_accept).html(
        //   '<button class="btn btn_refuse">Đã từ chối</button>'
        // );
        // $(_html_accept_rq).html(
        //   '<button class="btn btn_refuse">Đã từ chối</button>'
        // );
        location.reload();
      }, 200);
    },
  });
  return false;
}

function ajax_accept_appointment(id) {
  event.preventDefault();
  id = parseInt(id);
  var _html = "#user_pair_connect_" + id;
  var _html_accept = "#refuse_or_accept_" + id;
  var _html_accept_rq = "#request_refuse_or_accept_" + id;

  $.ajax({
    url: "/ajax/accept-appointment",
    method: "POST",
    data: {
      bok_id: parseInt(id),
    },
    success: function (data) {
      // console.log(data);
      setTimeout(function () {
        var result = JSON.parse(data);
        if (result.status == 200) {
          $("#modal_reply_" + id).modal("hide");
          toastr.success(result.message);
          $(_html).addClass("accept");
          $(_html_accept).html(
            '<span class="check_accept"><i class="icon icon-check"></i>Đã kết nối</span>'
          );
          $(_html_accept_rq).html(
            '<span class="check_accept"><i class="icon icon-check"></i>Đã kết nối</span>'
          );
          console.log(result);
          socket.emit('create-channel', {
            token: token,
            mentee_id: result.mentee_id,
            mentee_name: result.mentee_name,
            mentee_avatar: result.mentee_raw_avatar,
            mentor_id: result.mentor_id,
            mentor_name: result.mentor_name,
            mentor_avatar: result.mentor_raw_avatar,
            type: 0,
          });

          // openChatBox(<?= $appointment->mentee_id ?>, '<?= $appointment['infoMentee']['name'] ?>', '<?= $appointment['infoMentee']['avatar'] ?>')
          // console.log(result, 'result');
          openChatBox(result.mentee_id, result.mentee_name, result.mentee_avatar);
          // chatDatabase
          //   .ref("channel/" + result.victim_id + "/" + result.owner_id)
          //   .update({
          //     status: 1,
          //   });
          // window.location.reload();
        } else {
          toastr.error(result.error);
          return false;
        }
      }, 200);
    },
  });
  return false;
}

function viewMoreNotifications(_element, use_id = 0) {
  event.preventDefault();
  var page = parseInt($(_element).attr("data-page")) || 2;
  var target = $(".top-notify-content");
  $.ajax({
    url: "/ajax/notifications",
    method: "GET",
    data: {
      page: page,
    },
    dataType: "json",
    beforeSend: function () {
      tagetWaitMe(target);
    },
    success: function (data) {
      target.waitMe("hide");
      var _html = "";
      $("#top-notify .top-cart-items.notification-box").addClass("view-all");
      var ids = [];
      var logo = "/upload/settings/rgg1561699309.png";
      data.forEach(function (item) {
        var id_nts = item.notification.id;
        var style = "";
        if (item.status == 1) {
          style = 'style="background-color: white"';
        }
        _html +=
          '<div id="notification-user-' +
          id_nts +
          '" class="top-cart-item clearfix" ' +
          style +
          ">\n" +
          '<div class="top-cart-item-image img-circle" style="overflow: hidden; background-color: #e3e7ebfc;">\n' +
          '                                                <a href="' +
          (item.notification.owner.link
            ? item.notification.owner.link
            : "javascript:void(0)") +
          '">\n' +
          '                                                        <img src="' +
          item.notification.owner.avatar +
          '"\n' +
          "                                                             onerror=\"this.onerror=null; this.src='" +
          logo +
          "'\"\n" +
          '                                                             alt=""/>\n' +
          "                                                </a>\n" +
          "                                            </div>" +
          '                                        <div class="top-cart-item-desc">\n' +
          '                                            <div class="top-cart-item-desc-left">\n' +

          '                                            <div class="notification-content">\n' +
          '                                                <a style="font-weight: normal;" href="/notification/' +
          id_nts +
          '">\n' +
          "                                                    " +
          item.notification.content +
          "\n" +
          "                                                </a>\n" +
          "                                            </div></div>\n" +
          "                                        </div>\n" +
          "                                    </div>";

        if (item.status == 0 || item.status == 2) {
          ids.push(id_nts);
        }
      });

      if (ids.length > 0) {
        viewAllNotification2(use_id, ids);
      }
      $("#notify-user").append(_html);
      if (data.length < 5) {
        $(_element).remove();
      } else {
        $(_element).attr("data-page", page + 1);
      }
    },
  });
}

function viewAllNotification2(use_id, ids) {
  // $('#top-notify-trigger span').html('0');

  $.ajax({
    url: "/ajax/notifications/read-all",
    method: "POST",
    data: {
      use_id: use_id,
      ids: ids,
    },
    success: function (data) {
      // data = JSON.parse(data);

      var total = $("#notification-unread").html();
      total = parseInt(total);
      /*$('#notification-unread').html(total - ids.length);*/
      $("#notification-unread").remove();
    },
  });
}

function readAllNotification() {
  // $('#top-notify-trigger span').html('0');

  $.ajax({
    url: "/ajax/notifications/read-all-2",
    method: "POST",
    data: {},
    success: function (data) {
      // console.log(data);
      data = JSON.parse(data);

      if (data === false) {
        toastr.error("Bạn đã đọc Tất cả Thông báo rồi.");
      } else {
        var total = $("#notification-unread").html();
        total = parseInt(total);
        toastr.success(data.message);
        $("#notification-unread").remove();
      }
    },
  });
}

function viewAllNotification(use_id, ids) {
  // $('#top-notify-trigger span').html('0');

  $.ajax({
    url: "/ajax/notifications/read-all",
    method: "POST",
    data: {
      use_id: use_id,
      ids: JSON.parse(ids),
    },
    success: function (data) {
      // data = JSON.parse(data);

      var total = $("#notification-unread").html();
      total = parseInt(total);
      /*$('#notification-unread').html(total - ids.length);*/
      $("#notification-unread").remove();
    },
  });
}

$(document).ready(function () {
  start_rating();
  $(".mentor_item").on({
    mousemove: function (e) {
      const pos = $(this).offset();
      var id = $(this).data("id");
      const info_box = $(".mentor_item_info_box_" + id);
      if (pos.left > 700) {
        info_box.css({
          top: "-5%",
          right: "95%",
        });
      } else {
        info_box.css({
          top: "-5%",
          left: "95%",
        });
      }
      info_box.show();
    },
    mouseleave: function (e) {
      const info_box = $(".mentor_item_info_box");
      info_box.hide();
    },
  });
});

function popupTerm() {
  var myElem = document.getElementById("modelTerms");
  if (myElem !== null) {
    setTimeout(function () {
      $("#modelTerms").modal("show");
    }, 500);
  }
}

function agree_term() {
  var check = $("#agree_terms");

  if (check.is(":not(:checked)")) {
    toastr.error("Bạn phải đồng ý điều khoản để tiếp tục");
    return false;
  }

  return true;
}

function readCookie(name) {
  var i,
    c,
    ca,
    nameEQ = name + "=";
  ca = document.cookie.split(";");
  for (i = 0; i < ca.length; i++) {
    c = ca[i];
    while (c.charAt(0) == " ") {
      c = c.substring(1, c.length);
    }
    if (c.indexOf(nameEQ) == 0) {
      return c.substring(nameEQ.length, c.length);
    }
  }
  return "";
}

function submit_ajax_test_mentor(ele, is_mentor) {
  var form = $(ele).parents("form");
  // var value = form.find('textarea[name=regist_message]').val();

  var current_redirect_url = readCookie("CURRENT_REDIRECT_URL");

  if (is_mentor == 1) {
    current_redirect_url = "/chuong-trinh-mentoring";
  } else {
    current_redirect_url = unescape(current_redirect_url);
  }

  $.post(form.attr("action"), form.serialize(), function (data) {
    var result = JSON.parse(data);
    result.error
      ? toastr.error(result.message)
      : (toastr.success(result.message),
        (window.location.href = current_redirect_url),
        $("#modal_test").modal("hide"),
        $("#btn_register_mentor").find("button").attr("disabled", "disabled"),
        $("#modal_test").show());
  });
}

function view_more_pair(ele) {
  var current_page = parseInt($(ele).attr("data-page"));
  var next_page = current_page + 1;
  var max_page = parseInt($(ele).attr("max-page"));

  if (next_page > max_page) {
    $(ele).hide();
    return;
  }

  var target = $(".top-cart-content");

  $.ajax({
    url: $(ele).attr("link"),
    type: "GET",
    data: {
      page: next_page,
    },
    beforeSend: function () {
      tagetWaitMe(target);
    },
    success: function (response) {
      $("#header_user_pair").append(response);
      target.waitMe("hide");
      $(ele).attr("data-page", next_page);
    },
  });
}

function submit_ajax_appointment(ele) {
  var form = $(ele).parents("form");
  // var value = form.find('textarea[name=regist_message]').val();
  var target = $(".modal-content");
  // console.log(form.serialize());
  $.ajax({
    type: "POST",
    url: form.attr("action"),
    data: form.serialize(),
    beforeSend: function () {
      tagetWaitMe(target);
    },
    success: function (data) {
      // console.log(data)
      var result = JSON.parse(data);
      if (result.error == 1) {
        target.waitMe("hide");
        toastr.error(result.message);
      } else {
        $(".model_appointment").modal("hide");
        target.waitMe("hide");
        toastr.success(result.message);
        location.reload();
      }
    },
    error: function (data) {
      console.log(data);
    },
  });
  // $.post(form.attr('action'), form.serialize(), function (data) {
  //     var result = JSON.parse(data);
  //     result.error ? toastr.error(result.message) :
  //         (toastr.success(result.message),
  //                 location.reload()
  //             // $('#modal_test').modal('hide'),
  //             // $('#btn_register_mentor').find('button').attr('disabled', 'disabled'),
  //             // $('#modal_test').show()
  //         );
  // });
}

function submit_ajax_update_appointment(ele) {
  var form = $(ele).parents("form");
  // var value = form.find('textarea[name=regist_message]').val();
  var target = $("#model_edit_appointment .modal-content");
  $.ajax({
    type: "POST",
    url: form.attr("action"),
    data: form.serialize(),
    beforeSend: function () {
      tagetWaitMe(target);
    },
    success: function (data) {
      var result = JSON.parse(data);
      if (result.error == 1) {
        target.waitMe("hide");
        toastr.error(result.message);
      } else {
        $("#model_edit_appointment").modal("hide");
        target.waitMe("hide");
        toastr.success(result.message);
        location.reload();
      }
    },
  });
  // $.post(form.attr('action'), form.serialize(), function (data) {
  //     var result = JSON.parse(data);
  //     result.error ? toastr.error(result.message) :
  //         (toastr.success(result.message),
  //                 $('#model_edit_appointment').modal('hide'),
  //                 location.reload()
  //             // $('#modal_test').modal('hide'),
  //             // $('#btn_register_mentor').find('button').attr('disabled', 'disabled'),
  //             // $('#modal_test').show()
  //         );
  // });
}

function validateReportForm(mentor_id) {
  $(".show_err").html("");

  var form = $("#report_form_" + mentor_id);
  var err = "";
  var time = form.find(".appointment_time");
  var location = form.find(".appointment_location");
  /*var content = form.find('.appointment_content');*/
  var content_1 = form.find(".appointment_content_1");
  var content_2 = form.find(".appointment_content_2");
  var content_3 = form.find(".appointment_content_3");
  var content_4 = form.find(".appointment_content_4");

  if (time.val().length === 0) {
    err += "<p>* Thời lượng gặp không được để trống \n</p>";
    time.addClass("error");
  } else {
    time.removeClass("error");
  }
  if (location.val().length === 0) {
    err += "<p>* Địa điểm gặp không được để trống \n</p>";
    location.addClass("error");
  } else {
    location.removeClass("error");
  }

  /*if (content.val().length === 0) {
        err += '<p>* Nội dung không được để trống \n</p>';
        content.addClass('error');
    } else {
        content.removeClass('error');
    }*/
  if (
    content_1.val().length === 0 ||
    content_2.val().length === 0 ||
    content_3.val().length === 0 ||
    content_4.val().length === 0
  ) {
    err += "<p>* Bạn cần điền đầy đủ các câu bên dưới \n</p>";
  }

  if (content_1.val().length === 0) {
    content_1.addClass("error");
  } else {
    content_1.removeClass("error");
  }

  if (content_2.val().length === 0) {
    content_2.addClass("error");
  } else {
    content_2.removeClass("error");
  }

  if (content_3.val().length === 0) {
    content_3.addClass("error");
  } else {
    content_3.removeClass("error");
  }

  if (content_4.val().length === 0) {
    content_4.addClass("error");
  } else {
    content_4.removeClass("error");
  }

  if (err.length > 0) {
    $(".show_err").append(err);
    return false;
  }
  return true;
}

function tagetWaitMe(taget) {
  taget.waitMe({
    effect: "rotation",
    text: "loading...",
    waitTime: -1,
  });
}

function showPopupNotiApp(app_id, name, to_id, time) {
  $("#top-notify").toggleClass("top-notify-open", false);
  $("#model_noti_app .js-title").text("Bạn có một lịch hẹn với " + name);
  $("#model_noti_app .js-time").text("vào lúc " + time);
  $("#model_noti_app .js-link-view").attr(
    "href",
    "/user/" + to_id + "?open-app=1"
  );
  $("#model_noti_app").modal("show");
}

function showPopupNotiFinishPair(to_id, name, content) {
  $("#top-notify").toggleClass("top-notify-open", false);
  $("#model_noti_finish_pair .js-body").text(content);
  $("#model_noti_finish_pair").modal("show");
}

function showPopupNotiAcceptConnect(to_id, to_name, from_id, from_name) {
  $("#top-notify").toggleClass("top-notify-open", false);
  $("#model_noti_accept_connect .js-body").text(
    from_name + " đã đồng ý kết nối, hãy bắt đầu nhắn tin để đặt lịch hẹn!"
  );
  // $("#model_noti_accept_connect .js-btn-message").attr(
  //   "onclick",
  //   "openChatBox(" + from_id + ")"
  // );
  $("#model_noti_accept_connect .js-link-app").attr(
    "href",
    "/user/" + from_id + "?open-book-app=1"
  );
  $("#model_noti_accept_connect").modal("show");
}

function load_date() {
  $(".input-daterange .date").datepicker({
    autoclose: true,
    format: "dd-mm-yyyy",
    sideBySide: true,
    startDate: "today",
    todayHighlight: false,
  });

  $.fn.datepicker.dates["vi"] = {
    days: ["Chủ nhật", "Thứ 2", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6", "Thứ 7"],
    daysShort: ["CN", "T2", "T3", "T4", "T5", "T6", "T7"],
    daysMin: ["CN", "T2", "T3", "T4", "T5", "T6", "T7"],
    months: [
      "Tháng 1",
      "Tháng 2",
      "Tháng 3",
      "Tháng 4",
      "Tháng 5",
      "Tháng 6",
      "Tháng 7",
      "Tháng 8",
      "Tháng 9",
      "Tháng 10",
      "Tháng 11",
      "Tháng 12",
    ],
    monthsShort: [
      "Th1",
      "Th2",
      "Th3",
      "Th4",
      "Th5",
      "Th6",
      "Th7",
      "Th8",
      "Th9",
      "Th10",
      "Th11",
      "Th12",
    ],
    today: "Hôm nay",
    clear: "Xóa",
    format: "dd-mm-yyyy",
    titleFormat: "MM yyyy",
    /* Leverages same syntax as 'format' */
    weekStart: 0,
  };

  $(".appointment-date").datepicker({
    format: "dd-mm-yyyy",
    maxViewMode: 3,
    language: "en",
  });

  $(".timepicker").timepicker({
    showInputs: false,
    minuteStep: 1,
  });
}

function get_appointment(apm_id, get_mentor = 0) {
  if (!$("#model_appointment_list_" + apm_id).length) {
    $.ajax({
      url: "/get-appointment",
      method: "GET",
      data: {
        apm_id: parseInt(apm_id),
        get_mentor: parseInt(get_mentor),
      },
      success: function (data) {
        // setTimeout(function () {
        $(".content-wrap").append(data);
        load_icheck();
        load_date();
        // load_report();
        $("#model_appointment_list_" + apm_id).modal("show");
        // }, 200);
      },
    });
  } else {
    $("#model_appointment_list_" + apm_id).modal("show");
  }
}

function load_show_report_appointment(pair_id, info_id) {
  $("#modal_show_report_" + pair_id).on("shown.bs.modal", function () {
    $("#model_appointment_list_" + info_id).modal("hide");
  });

  $("#modal_show_report_" + pair_id).on("hidden.bs.modal", function () {
    setTimeout(function () {
      $("#model_appointment_list_" + info_id).modal("show");
    }, 200);
  });
}

function show_report_appointment(apm_id, pair_id, info_id = 0) {
  if (!$("#modal_show_report_" + pair_id).length) {
    $.ajax({
      url: "/show-report-appointment",
      method: "GET",
      data: {
        apm_id: parseInt(apm_id),
        pair_id: parseInt(pair_id),
      },
      success: function (data) {
        $(".content-wrap").append(data);
        setTimeout(function () {
          load_show_report_appointment(pair_id, info_id);
        }, 100);
        setTimeout(function () {
          $("#" + "btn-report_" + apm_id).removeClass("red-circle");
          $("#modal_show_report_" + pair_id).modal("show");
        }, 200);
      },
    });
  } else {
    $("#modal_show_report_" + pair_id).modal("show");
  }
}

function load_edit_appointment(pair_id, info_id) {
  $("#model_edit_appointment_" + pair_id).on("shown.bs.modal", function () {
    console;
    $("#model_appointment_list_" + info_id).modal("hide");
  });

  $("#model_edit_appointment_" + pair_id).on("hidden.bs.modal", function () {
    setTimeout(function () {
      $("#model_appointment_list_" + info_id).modal("show");
    }, 200);
  });
}

function edit_appointment(apm_id, info_id) {
  if (!$("#model_edit_appointment_" + apm_id).length) {
    $.ajax({
      url: "/sua-lich",
      method: "GET",
      data: {
        apm_id: parseInt(apm_id),
      },
      success: function (data) {
        $(".content-wrap").append(data);
        setTimeout(function () {
          load_edit_appointment(apm_id, info_id);
          load_date();
          load_icheck();
          //                 $('.input-daterange .date').datepicker({
          //                     autoclose: true,
          //                     format: "dd-mm-yyyy",
          //                     sideBySide: true,
          //                     startDate: "today",
          //                     todayHighlight: false
          //                 });

          //                 //Timepicker
          //                 $('.timepicker').timepicker({
          //                     showInputs: false,
          //                     minuteStep: 1,
          // //            timeFormat: 'H:i:s'
          //                 });
          $("#model_edit_appointment_" + apm_id).modal("show");
        }, 200);
      },
    });
  } else {
    $("#model_edit_appointment_" + apm_id).modal("show");
  }
}

// Footer

// var countDownDate = new Date("May 15, 2020 23:59:59").getTime();

// // Update the count down every 1 second
// var countdown = setInterval(function () {
//   // Get today's date and time
//   var now_popup = new Date().getTime();

//   // Find the distance between now and the count down date
//   var distance_popup = countDownDate - now_popup;

//   // Time calculations for days, hours, minutes and seconds
//   var days_popup = Math.floor(distance_popup / (1000 * 60 * 60 * 24));
//   var hours_popup = Math.floor(
//     (distance_popup % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)
//   );
//   var minutes_popup = Math.floor(
//     (distance_popup % (1000 * 60 * 60)) / (1000 * 60)
//   );
//   var seconds_popup = Math.floor((distance_popup % (1000 * 60)) / 1000);

//   // Display the result in the element with id="demo"
//   document.getElementById("mt-popup-day").innerHTML = days_popup + " NGÀY";
//   document.getElementById("mt-popup-hour").innerHTML =
//     "00".substring(0, 2 - (hours_popup + "").length) + (hours_popup + "");
//   document.getElementById("mt-popup-minute").innerHTML =
//     "00".substring(0, 2 - (minutes_popup + "").length) + (minutes_popup + "");
//   document.getElementById("mt-popup-second").innerHTML =
//     "00".substring(0, 2 - (seconds_popup + "").length) + (seconds_popup + "");

//   // If the count down is finished, write some text
//   if (distance_popup < 0) {
//     clearInterval(countdown);
//     document.getElementById("mt-popup-timer").innerHTML =
//       '<span class="mt-popup-countdown">Hết hạn</span>';
//   }
// }, 1000);

function submitContact() {
  $("#contactUs").validate({
    submitHandler: function (form) {
      $.ajax({
        url: "/ajax/mt-popup-contact",
        method: "POST",
        data: $("#contactUs").serialize(),
        success: function (data) {
          var result = JSON.parse(data);
          if (result.status == 200) {
            $("#messageSuccess").show();
          } else {
            $("#messageSuccess").hide();
            toastr.error(result.message);
            return false;
          }
        },
      });
    },
    rules: {
      email: {
        required: true,
        email: true,
      },
    },
    messages: {
      email: {
        required: "Đây là trường bắt buộc",
        email: "Email không hợp lệ",
      },
    },
  });
}

function getCookie(cname) {
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(";");
  for (var i = 0; i < ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == " ") {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return false;
}

function getMobileOperatingSystem() {
  var userAgent = navigator.userAgent || navigator.vendor || window.opera;
  if (userAgent.match(/iPad/i) || userAgent.match(/iPhone/i) || userAgent.match(/iPod/i)) {
    return 'iOS';
  }
  else if (userAgent.match(/Android/i)) {
    return 'Android';
  }
  else {
    return 'unknown';
  }
}

function setCookie(cname, cvalue, exdays) {
  var d = new Date();
  d.setTime(d.getTime() + exdays * 24 * 60 * 60 * 1000);
  var expires = "expires=" + d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

$(document).ready(function () {
  $(window).bind("load", function () {
    setTimeout(function () {
      if (getCookie("POP_UP_START") != 1) {
        // switch (getMobileOperatingSystem()) {
        //   case 'Android':
        //     // $("#popupAndroid").modal("show");
        //     $("#home-mobile").attr("href", "https://play.google.com/store/apps/details?id=com.mentori.Mentori")

        //     break;
        //   case 'iOS':
        //     // $("#popupAppstore").modal("show");
        //     $("#home-mobile").attr("href", "https://apps.apple.com/vn/app/mentori/id1503372381")
        //     break;
        //   default:
        //     break;
        // }
        // $("#noticeModal").modal("show");
        var url = window.location.href;
        if (url.indexOf('valentine-special-event-hoc-quot-chung-quot-cung-doi-uu-dai-nhan-doi-1467.html') > -1) {
          // Do something if the URL contains the string
        } else {
          $("#popupCountdown").modal("show");
        }
        if ($("#check-empty-field").length) {
          $("#add-interest-field").modal("show");
        } else {
          if ($("#check-no-review").length) {
            $("#no-review").modal("show");
          }
        }
      } else {
        if ($("#check-no-review").length) {
          $("#no-review").modal("show");
        }
      }
    }, 1500);
  });

  $("#popupAndroid").on("hidden.bs.modal", function () {
    setCookie("POP_UP_START", 1, 30);
  });

  $("#noticeModal").on("hidden.bs.modal", function () {
    setCookie("POP_UP_START", 1, 30);
  });

  $("#add-interest-field").on("hidden.bs.modal", function () {
    setCookie("POP_UP_START", 1, 30);
  });


  $("#popupAppstore").on("hidden.bs.modal", function () {
    setCookie("POP_UP_START", 1, 30);
  });

  $("#notice_view_btn").on("click", function () {
    setCookie("POP_UP_START", 1, 30);
  });

  $("#popupCountdown").on("hidden.bs.modal", function () {
    setCookie("POP_UP_START", 1, 30);
  });

  $(".form-check-input").iCheck({
    checkboxClass: "icheckbox_square-green",
    radioClass: "iradio_square-green",
    increaseArea: "15%", // optional
  });
  $(".form-check-input").on("ifChecked", function (event) {
    // $(this).parent().parent().css('color', 'green');
    $("#field_child_" + $(this).val())
      .removeClass("hide")
      .addClass("show");
  });
  $(".form-check-input").on("ifUnchecked", function (event) {
    // $(this).parent().parent().css('color', '#DD4B39');
    $("#field_child_" + $(this).val())
      .removeClass("show")
      .addClass("hide");
    $(".field_type_2").iCheck("uncheck");
  });
});

$("#top-user").on("click", function () {
  $("#select_user_box").css("display", "block");
});

function validateFeedbackForm(form_id) {
  var form = $("#" + form_id);

  var content = form.find("textarea[name=content]").val();
  var star = form.find("input[name=score]").val();

  if (!content) {
    toastr.error('Vui lòng điền đầy đủ nội dung!!');
    form.find("textarea[name=content]").addClass('error');
    return false;
  }
  if (!star) {
    toastr.error('Bạn chưa đánh giá!!');
    return false;
  }

  return true;
}

$(".item-field").on("click", function () {
  var check_input = $(this).prev();
  if (!check_input.is(":checked")) {
    $(this).addClass("item-field-selected");
    $('#btn-add-interest-field').removeAttr('disabled');

  } else {
    $(this).removeClass("item-field-selected");
    $('#btn-add-interest-field').removeAttr('disabled');
  }
});

function ajax_save_field() {

  var post_data = JSON.parse(JSON.stringify($('input[name="fields"]:checked').serializeArray()));
  var form_data = new FormData();
  var arrFields = [];

  for (var key in post_data) {
    if (post_data[key]["name"] == "fields") {
      arrFields.push(post_data[key]["name"]);
    }
  }

  if (arrFields.length == 0) {
    toastr.error(
      "Bạn phải lựa chọn lĩnh vực quan tâm"
    );
    return;
  }

  for (var key in post_data) {
    // console.log(post_data[key]["value"]);
    if (post_data[key]["name"] == "fields") {
      form_data.append("fields[]", post_data[key]["value"]);
    }
  }

  $.ajax({
    url: '/ajax/save-field',
    method: 'POST',
    data: form_data,
    enctype: "multipart/form-data",
    processData: false,
    contentType: false,
    cache: false,
    success: function (result) {
      const data = JSON.parse(result);
      // console.log(data); 
      if (data.error == 0) {
        setCookie("POP_UP_START", 1, 30);
        // $("#add-interest-field").modal("hide");
        toastr.success(data.message);
        window.location.href = "/for-you";
      } else {
        toastr.error(data.message);
      }
    }
  });
}

function click_banner_ads(id) {

  var form_data = new FormData();
  // mentor_id = parseInt($("#use_id").val());
  var post_data = {
    id: id,
  };

  $.each(post_data, function (key, value) {
    form_data.append(key, value);
  });

  $.ajax({
    url: "/ajax/ads",
    method: "POST",
    data: form_data,
    enctype: "multipart/form-data",
    processData: false,
    contentType: false,
    cache: false,
    beforeSend: function () { },
    success: function (data) {
      // if (can_connect == -6) {
      //     window.location.href = "/user-info";
      // } else if (can_connect == -7) {
      //     window.location.href = "/login";
      // }
    },
  });
}

function ajax_feedback_mentori(type = 6) {
  // mentor_id = parseInt(mentor_id);
  var form_data = new FormData();
  var content = $("#form-feedback-mentori textarea[name=content]").val();
  if (type == 6) {
    var score = 0;
  }
  // var duration = $("input[name=bok_duration]").val();
  // var start_time = $("input[name=bok_start_time]").val();
  // var ufr_id = $("input[name=bok_ufr_id]").val();
  // var bok_address = $("#reg_contact_type").find(":selected").val();

  // var intro = $("#myModalBookAppointment5 textarea[name=bok_intro]").val();

  // var code = $("#myModalBookAppointment5 input[name=bok_code]").val();


  if (content == "") {
    toastr.error("Bạn cần điền đầy đủ thông tin");
    return false;
  }

  var post_data = {
    content: content,
    type: type,
    score: score
  };

  $.each(post_data, function (key, value) {
    form_data.append(key, value);
  });

  $.ajax({
    url: "/ajax/feedback-mentori",
    method: "POST",
    data: form_data,
    enctype: "multipart/form-data",
    processData: false,
    contentType: false,
    cache: false,
    beforeSend: function () { },
    success: function (data) {
      var result = JSON.parse(data);
      if (result.success) {
        // console.log(result);
        toastr.success(result.message);
        $("#feedback-mentori-1").modal("hide");
        $("#feedback-mentori-2").modal("show");
        // $("#connect_mentor_pair .btn-info").remove();
        // $("#connect_mentor_pair .box-group-custom-top").prepend(
        //   '<a style="cursor: pointer;" onclick="ajax_get_pair_details(' +
        //   result.id +
        //   ')" class="btn btn-waiting-connect btn-box-top-lg">Đã đặt lịch hẹn</a>'
        // );
        // $("#myModalBookAppointment5").modal("hide");
        // if (result.bok_status == 0) {
        //   $("#add-money").text(result.money);
        //   $("#myModalBookAppointment6").modal("show");
        //   window.location.hash = 'step=5';
        // } else if (result.bok_status == 1) {
        //   $("#myModalBookAppointment7").modal("show");
        //   window.location.hash = 'step=5';
        // }
      } else {
        toastr.error(result.message);
      }
    },
  });
}

$('input[type=radio][name=review-type]').change(function () {
  if (this.value == 'review-1') {
    $('#review-type-1').removeClass("d-none");
    $('#review-type-2').addClass("d-none");
  } else if (this.value == 'review-2') {
    $('#review-type-2').removeClass("d-none");
    $('#review-type-1').addClass("d-none");

  }
});

$('input[type=radio][name=reason-type]').change(function () {
  $('.item-field-radio').removeClass('item-field-radio-selected');
  $(this).next().addClass("item-field-radio-selected");
});

$(".item-exp-txt").on("click", function () {
  $('#no-review textarea[name=content]').val(this.innerHTML);
  this.remove();
});

function postReview() {
  var review_type = $('#no-review input[type=radio][name=review-type]:checked').val();
  if (review_type == 'review-1') {
    var bok_id = $('#no-review input[name=bok_id]').val();
    var score = $('#no-review input[name=score]').val();
    var course_id = 0;
    $('input[name="course_id"]:checked').each(function () {
      course_id = this.value;
    });
    var content = $('#no-review textarea[name=content]').val();

    if (!content) {
      toastr.error('Vui lòng điền đầy đủ nội dung!');
      $("#no-review textarea[name=content]").addClass('error');
      return false;
    }
    if (!score) {
      toastr.error('Bạn chưa đánh giá!!');
      return false;
    }

    var form_data = new FormData();

    var post_data = {
      content: content,
      score: score,
      course_id: course_id,
    };

    $.each(post_data, function (key, value) {
      form_data.append(key, value);
    });

    $.ajax({
      url: "/ajax/appointments/" + bok_id + "/review",
      method: "POST",
      data: form_data,
      enctype: "multipart/form-data",
      processData: false,
      contentType: false,
      cache: false,
      beforeSend: function () { },
      success: function (data) {
        var result = JSON.parse(data);
        if (result.status == 200) {
          toastr.success(result.message);
          $('#no-review').modal("hide");
          // $("#feedback-mentori-1").modal("hide");
          // $("#feedback-mentori-2").modal("show");
        } else {
          toastr.error(result.message);
        }
      },
    });
  } else if (review_type == 'review-2') {
    var bok_id = $('#no-review input[name=bok_id]').val();
    var reason_type = $('#no-review input[name="reason-type"]:checked').val();
    var report = $('#no-review textarea[name=report]').val();

    if (!reason_type) {
      toastr.error('Vui lòng chọn lý do!');
      return false;
    }
    if (reason_type == 'Lý do khác') {
      if (!report) {
        toastr.error('Vui lòng điền đầy đủ nội dung!');
        $("#no-review textarea[name=report]").addClass('error');
        return false;
      }
    }

    var content = reason_type + '. ' + report;

    var form_data = new FormData();

    var post_data = {
      content: content,
      // bok_id: bok_id,
    };

    $.each(post_data, function (key, value) {
      form_data.append(key, value);
    });

    $.ajax({
      url: "/ajax/appointments/" + bok_id + "/report",
      method: "POST",
      data: form_data,
      enctype: "multipart/form-data",
      processData: false,
      contentType: false,
      cache: false,
      beforeSend: function () { },
      success: function (data) {
        var result = JSON.parse(data);
        if (result.status == 200) {
          toastr.success(result.message);
          $('#no-review').modal("hide");
        } else {
          toastr.error(result.message);
        }
      },
    });

  } else {
    toastr.error('Vui lòng điền đầy đủ thông tin!!');
    return false;
  }
}
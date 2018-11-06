 $('#review-form-edit').on("show.bs.modal", function(e) {
        $(this).find('.modal-body').load(e.relatedTarget.dataset.url);
        });

 $('#user-form-edit').on("show.bs.modal", function(e) {
        console.log("hello thang nhe");
        $(this).find('.modal-body').load(e.relatedTarget.dataset.url);
        });

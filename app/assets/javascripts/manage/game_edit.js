 $('#game-form-edit').on("show.bs.modal", function(e) {
        console.log("hello thangtqt");
        $(this).find('.modal-content').load(e.relatedTarget.dataset.url);
        });


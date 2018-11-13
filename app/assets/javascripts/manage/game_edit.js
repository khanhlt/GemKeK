 $('#game-form-edit').on("show.bs.modal", function(e) {
        console.log("hello thangtqt");
        $(this).find('.modal-content').load(e.relatedTarget.dataset.url);
        });
 $('#genre-form-edit').on("show.bs.modal", function(e) {
        console.log("hello thangtqt");
        $(this).find('.modal-content').load(e.relatedTarget.dataset.url);
        });
 $('#platform-form-edit').on("show.bs.modal", function(e) {
        console.log("hello thangtqt platform");
        $(this).find('.modal-content').load(e.relatedTarget.dataset.url);
        });
 
 
$(document).ready(function () {
    /*alert('Invigilator Page Loaded Successfully!');*/
    //if ($('#studentRecordsTable').length > 0) {
    //    paginateStudentTable(10); // 10 rows per page
    //}

    $('#bulkUpload').hide();
    //alert('don');
    $('#bulk_upload').on('click', function () {
        $('#bulkUpload').show();
        $('#manualUpload').hide();
        $('#UploadTable').hide();


        $('#manual_entry').removeClass('active');
        $('#bulk_upload').addClass('active');

    })
    $('#manual_entry').on('click', function () {
        $('#bulkUpload').hide();
        $('#manualUpload').show();
        $('#UploadTable').show();


        $('#bulk_upload').removeClass('active');
        $('#manual_entry').addClass('active');
    })

    // Get the client-side ID of the ASP.NET FileUpload control
    // from the data attribute on the custom label.
    const studentFileInputId = $('#selectStudentFile').data('target-file-input-id');

    // Check if the ID was successfully retrieved to prevent errors
    if (!studentFileInputId) {
        console.error("Error: Could not retrieve studentFile ClientID. Make sure the data-target-file-input-id attribute is correctly set on #selectStudentFile.");
        return; // Exit the function if the ID is not found
    }

    // Event listener for when the custom "Select File" label is clicked
    $('#selectStudentFile').on('click', function () {
        // Trigger a click on the hidden file input element using the retrieved ID
        // This is the key change to use the correct client-side ID
        $('#' + studentFileInputId).trigger('click');
        // Removed alert("done"); for a smoother user experience
    });

    // Event listener for when a file is selected in the hidden file input
    // This uses the dynamically retrieved ID to attach the change listener
    $('#' + studentFileInputId).on('change', function () {
        // 'this' refers to the native DOM element of the file input
        if (this.files && this.files.length > 0) {
            // Get the name of the first selected file
            const fileName = this.files[0].name;

            // Update the text of the custom label to show the selected file name
            $('#selectStudentFile').html('<i class="fas fa-file-import pe-2"></i> Change File'); // Changed text
            $('#selectedFileName').text(fileName); // Update the new file-name div
        } else {
            // If no file is selected (e.g., user cancels the dialog), revert to original text
            $('#selectStudentFile').html('<i class="fas fa-file-import pe-2"></i> Select File');
            $('#selectedFileName').text('No file selected'); // Revert text in the new div
        }
    });
});

function paginateStudentTable(rowsPerPage = 10) {
    const table = $('#studentRecordsTable');
    const rows = table.find('tbody tr');
    const totalRows = rows.length;
    const totalPages = Math.ceil(totalRows / rowsPerPage);
    const paginationDiv = $('#studentTablePagination');

    let currentPage = 0;

    function showPage(page) {
        rows.hide();
        const start = page * rowsPerPage;
        const end = start + rowsPerPage;
        rows.slice(start, end).show();
        currentPage = page;
        updatePaginationButtons();
    }

    function updatePaginationButtons() {
        let buttonsHtml = '';

        // Prev button
        buttonsHtml += `<button class="btn btn-sm btn-outline-primary me-1" ${currentPage === 0 ? 'disabled' : ''} id="prevPageBtn">Prev</button>`;

        // Page buttons
        for (let i = 0; i < totalPages; i++) {
            buttonsHtml += ` <button class="page-btn btn btn-sm ${i === currentPage ? 'btn-primary' : 'btn-outline-secondary'} mx-1" data-page="${i}">${i + 1}</button>`;
        }

        // Next button
        buttonsHtml += `<button class="btn btn-sm btn-outline-primary ms-1" ${currentPage === totalPages - 1 ? 'disabled' : ''} id="nextPageBtn">Next</button>`;

        paginationDiv.html(buttonsHtml);

        // Attach events
        $('.page-btn').click(function () {
            const page = parseInt($(this).data('page'));
            showPage(page);
        });

        $('#prevPageBtn').click(function () {
            if (currentPage > 0) showPage(currentPage - 1);
        });

        $('#nextPageBtn').click(function () {
            if (currentPage < totalPages - 1) showPage(currentPage + 1);
        });
    }

    // Initial render
    showPage(0);
}


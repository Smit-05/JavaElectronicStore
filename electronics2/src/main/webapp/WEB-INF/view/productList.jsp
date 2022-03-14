<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product List</title>
</head>
<body>
	<div class="m-3 table-responsive">

		<table class="table table-hover" id="myTable" class="display">
			<thead>
				<tr>
					<th>Edit</th>
					<th>Name</th>
					<th>Description</th>
					<th>Price</th>
					<th>Discount</th>
					<th>Category</th>
					<th>Units</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>


				<?php
                $query = "select * from items";
                $result = mysqli_query($conn, $query);
                if (is_nan(mysqli_num_rows($result)) || mysqli_num_rows($result) == 0) {
                    echo "<p class='display-4 text-primary text-center mt-5'>Not Any Item is inserted.</p>";
                } else {
                    while ($data = mysqli_fetch_assoc($result)) {
                        echo "<tr id='" . $data['i_id'] . "'>";
                        echo "<td> <a type='button' href='./i_update.php?update=" . $data['i_id'] . "' class='btn btn-outline-primary edit'>Edit</a> </td>"; //edit
                        echo "<td>" . $data['i_name'] . "</td>";
                        echo "<td>" . $data['i_price'] . "</td>";
                        echo "<td>" . $data['i_quantity'] . "</td>";
                        echo "<td>" . $data['i_unit'] . "</td>";
                        // echo "<td>" . $data['i_isselling'] . "</td>";

                        echo "<td><div class='form-check form-switch'>";

                ?>
				<input type="checkbox" class="form-check-input mx-auto"
					id="<?php echo $data['i_id']; ?>"
					onclick='activation(this,"<?php echo $data['i_name']; ?>")'
				<?php
                                                                                                                                                                                if ($data['i_isselling'] == 1) {
                                                                                                                                                                                    echo "checked";
                                                                                                                                                                                }
                                                                                                                                                                                ?>
				>
				<?php
                        echo "</td></div>";

                        echo "<input type='hidden' value='" . $data['i_photo'] . "'>";
                        echo "<td> <a type='button' onclick='return delete_confirm()' href='./partial/i_delete.php?delete=" . $data['i_id'] . "' class='btn btn-outline-danger'>Delete</a> </td>"; //delete
                        echo "</tr>";
                    }
                }
                ?>



			</tbody>
		</table>

	</div>
	
	<script>
    function delete_confirm() {
        if (confirm("Are you sure to delete it.")) {
            return true;
        } else {
            return false;
        }
    }
    /* Initialise the table with the required column ordering data types */

    $(document).ready(function() {
        $('#myTable').DataTable({
            "dom": ' <"#length"l><"#search"f>rt<"info"i><"page"p>',
            "stateSave": true
        });
    });

</script>
</body>
</html>



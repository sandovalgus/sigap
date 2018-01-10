jQuery ->
	$('#users').DataTable({
		responsive: true,
		columnDefs: [
            { responsivePriority: 1, targets: -1 },
            { responsivePriority: 2, targets: -2 }
        ]
		language: {
        	search: "_INPUT_",
        	
        	paginate: {
	            first:      "Primero",
	            previous:   "Anterior",
	            next:       "Siguiente",
	            last:       "Último"
        	},
        	info: "Página _PAGE_ de _PAGES_",
        	lengthMenu: "Ver _MENU_ resultados"
    	}
	})
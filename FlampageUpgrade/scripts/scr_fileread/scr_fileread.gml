function scr_fileread() {
	file = file_text_open_read(working_directory + "datawaves.csv");

	for (var i = 0; i <= 150; i++) {
		for (var j = 0; j <= 9; j++) {
			w[i,j] = file_text_read_real(file);
		}
	}
	file_text_close(file);


}

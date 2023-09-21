

Qa).How many types of tigers can be found in the taxonomy table of the dataset?
	query used:-
		SELECT DISTINCT COUNT(species) FROM taxonomy WHERE species LIKE "%Panthera tigris%";
	answer:-
		8

  What is the "ncbi_id" of the Sumatran Tiger? (hint: use the biological name of the tiger)
	query Used
		SELECT ncbi_id FROM taxonomy WHERE species LIKE "%Sumatran tiger%";
	answer:-
		

Qb).Find all the columns that can be used to connect the tables in the given database.

	query used:-
		SELECT
			TABLE_NAME,
			COLUMN_NAME,
			CONSTRAINT_NAME,
			REFERENCED_TABLE_NAME,
			REFERENCED_COLUMN_NAME
		FROM
			INFORMATION_SCHEMA.KEY_COLUMN_USAGE
		WHERE
			REFERENCED_TABLE_NAME IS NOT NULL;
	Answer:-
		answer in 'que_2_part_b_solution.csv' file included in the folder
		
		

Qc).Which type of rice has the longest DNA sequence? (hint: use the rfamseq and the taxonomy tables)
	query used:-
		SELECT tx.species , MAX(rf.length)
		FROM rfamseq rf, taxonomy tx 
		WHERE rf.ncbi_id = tx.ncbi_id and tx.species LIKE '%Oryza sativa%';
	Answer:-
		species						MAX(rf.length)
		Oryza sativa Indica Group	47244934
		
		
		
Qd)We want to paginate a list of the family names and their longest DNA sequence lengths (in descending order 
of length) where only families that have DNA sequence lengths greater than 1,000,000 are included. Give a query 
that will return the 9th page when there are 15 results per page
	query:-
			SELECT accession , tree_display_name , MAX(length)
			FROM rfamseq rf , taxonomy tx
			WHERE rf.ncbi_id = tx.ncbi_id and length> 1000000
			GROUP BY accession , tree_display_name
			ORDER BY length DESC
			limit 15 offset 120;

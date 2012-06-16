/*
  Clean up script used from 3.x to 4.2 migration.

  Basically drop rows that doesn't satisfy the new integrity constraints
 */

DELETE FROM BODYCONTENT USING BODYCONTENT LEFT JOIN CONTENT
  on (BODYCONTENT.CONTENTID = CONTENT.CONTENTID)
  WHERE BODYCONTENT.CONTENTID is not null AND CONTENT.CONTENTID is null;

DELETE FROM CONFANCESTORS USING CONFANCESTORS LEFT JOIN CONTENT
  on (CONFANCESTORS.DESCENDENTID = CONTENT.CONTENTID)
  WHERE CONFANCESTORS.DESCENDENTID is not null AND CONTENT.CONTENTID is null;



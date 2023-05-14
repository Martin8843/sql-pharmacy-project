--insert data into the DELIVERIES table

INSERT INTO deliveries
 VALUES (1
		 , 'Dostawa kurierem DPD'
		 , 13.99
		 );
INSERT INTO deliveries
 VALUES (2
		 , 'DPD Pick up'
		 , 10.99
		 );
INSERT INTO deliveries
 VALUES (3
		 , 'Paczkomat Inpost'
		 , 9.99
		 );
INSERT INTO deliveries
 VALUES (4
		 , 'Odbiór własny'
		 , 0
		 ) ;

--insert data into the USERS table
INSERT INTO users 
VALUES (100
		, 'Adam'
		, 'Bartasek'
		, 'adabar02'
		,'adambar21@gmail.com'
		,'707-223-112'
		,'Barta','PL9322933200'
		, 9930
		);																													 
INSERT INTO users(user_id, first_name, last_name, login, address_email, phone_number, company_name, tax_id ) 
VALUES (101, 'Aleksandra', 'Czystek', 'alsczy01','olaczys011@interia.pl','788-776-112','Opus','PL9330033200') ;
INSERT INTO users 
VALUES (102
		, 'Jan'
		, 'Kozak'
		, 'jankoz21'
		,'janek300@gmail.com'
		,'703-213-122', 'Kozakow'
		,'PL9333233204'
		, 9530
		);
INSERT INTO users 
VALUES (103
		, 'Krystian'
		, 'Domowy'
		, 'krydom04'
		,'kdomowy@yahoo.com'
		,'800-223-122'
		, 'Signature'
		,'PL9325593232'
		, 1130
		) ;
INSERT INTO users 
VALUES (104
		, 'Marta'
		, 'Kogut'
		, 'markog43'
		, 'marta499@gmail.com'
		, '609-344-112'
		, 'Polinezja'
		, 'PL9322888400' 
		, 9440);
INSERT INTO users 
VALUES (105
		, 'Tomasz'
		, 'Hifner'
		, 'tomhif33'
		, 'tomhif99@gmail.com'
		, '501-223-443'
		, 'Efashion'
		, 'PL9322939970'
		, 1140
		) ;
INSERT INTO users 
VALUES (106
		,  'Syliwa'
		, 'Knopik'
		, 'sylkno44'
		, 'sknop388@gmail.com'
		, '504-883-901'
		, 'Komputronik'
		, 'PL9322933456'
		, 8800) ;
INSERT INTO users(user_id, first_name, last_name, login, address_email, phone_number, company_name, tax_id ) 
VALUES (107, 'Kamil', 'Konewka', 'kamko30','kamilk23@gmail.com','554-332-440','Oktawianus','PL9322922933');
INSERT INTO users 
VALUES (108
		, 'Katarzyna'
		, 'Tarka'
		, 'kaska44'
		, 'katarka@gmail.com'
		, '509-339-990'
		, 'Kombus'
		, 'PL9322998470'
		, 9432
		);
INSERT INTO users 
VALUES (109
		, 'Maciej'
		, 'Domański'
		, 'macdom45'
		, 'maciejdom5@gmail.com'
		, '601-899-233'
		, 'Varta'
		, 'PL8832133200'
		, 2090);

					
--insert data into the PARTNER table
INSERT INTO partners
VALUES (partners_seq.nextval
		, 'INTERFORUM PHARMA Sp. z o.o.');
		
INSERT INTO partners
VALUES (partners_seq.nextval
		, '4Pharm Group');
		
INSERT INTO partners
VALUES (partners_seq.nextval
		, 'Hurtownia Farmaceutyczna Actifarm');
		
INSERT INTO partners
VALUES (partners_seq.nextval
		, 'ACP PHARMA S.A.');
		
INSERT INTO partners
VALUES (partners_seq.nextval
		, 'ASTELLAS PHARMA Sp. z o.o.');
		
		
--insert data into the PAYMENTS table
INSERT INTO payments 
VALUES (1
, 'Karta kredytowa');

INSERT INTO payments
VALUES (2
, 'Przelew bankowy');

INSERT INTO payments
VALUES (3
, 'Blik');

--insert data into the STOCK table
INSERT INTO stock
 VALUES ('GSK-KS-60-694', 'Avodart 0.5', 99.50, 95, 50, 'szt.');
 
INSERT INTO stock
VALUES ('GSK-K-25-445', 'Dermovate 0.5', 50, 43, 56, 'szt.');

INSERT INTO stock
VALUES ('GSK-T-2-910', 'Imigran 50', 105, 99, 1, 'szt.');  
  
INSERT INTO stock
VALUES ('POL-T-30-011', 'Biotebal Max', 49, 38, 33, 'szt.'); 

INSERT INTO stock
VALUES ('GSK-T-20-993', 'Oxazepam', 89, 76, 44, 'szt.');  

INSERT INTO stock
VALUES ('POL-T-20-991', 'Polopiryna Max', 35, 29, 76, 'szt.' ); 
 
INSERT INTO stock
VALUES ('POL-R-10-002', 'Atrodil', 69, 55, 760, 'szt.');   

INSERT INTO stock VALUES ('POL-P-15-882', 'Clotrimazolum Medana', 80, 75, 44, 'szt.');

INSERT INTO stock 
VALUES ('AP-T-60-772', 'Amlozek 5', 77, 73, 34, 'szt.'); 

INSERT INTO stock 
VALUES ('AP-KS-56-820', 'Egzysta', 100, 93, 22, 'szt.');  

INSERT INTO stock 
VALUES ('AP-KP-10-445', 'Hialeye Duo', 110, 98, 54,'szt.'); 

INSERT INTO stock 
VALUES ('AP-PD-4.8-300', 'Oeparol everyday', 13, 9, 2,'szt.'); 

INSERT INTO stock 
VALUES ('AP-KS-100-304', 'Potazek +', 54, 49, 656,'szt.');  
     
INSERT INTO stock 
VALUES ('SDZ-T-100-112', 'ACC Optima 200', 30, 34, 77, 'szt.'); 

INSERT INTO stock 
VALUES ('USP-T-12-223', 'IBUPROM MAX', 16, 20, 65,'szt.'); 

INSERT INTO stock 
VALUES ('SM-P-250-101', 'Octenisept', 88, 81, 8,'szt.'); 

INSERT INTO stock 
VALUES ('USP-KS-20-220', 'Multilac', 77, 71, 55, 'szt.'); 

INSERT INTO stock 
VALUES ('SDZ-KS-30-110', 'Sumilar 10_10', 110, 100, 33, 'szt.'); 

INSERT INTO stock 
VALUES ('GSK-T-30-389', 'Triumeq', 140, 133, 78, 'szt.');      

INSERT INTO stock 
VALUES ('POL-T-30-223', 'Ranigast Famotydyna', 40, 37, 8,'szt.'); 

-- insert data into the CATEGORY_PRODUCTS table
INSERT INTO products_category
 VALUES (1
		, 'Trawienie'
		, 0
		);

INSERT INTO products_category
 VALUES (2
		 , 'Układ moczowo-płciowy i hormony płciowe'
		 , 23
		 );
 
INSERT INTO products_category
 VALUES (3
		 , 'Dermatologia'
		 , 8);
		 
INSERT INTO products_category
 VALUES (4
		 , 'Układ nerwowy'
		 , 8);
 
INSERT INTO products_category
 VALUES (5
		 , 'Witaminy'
		 , 0
		 );
 
INSERT INTO products_category
 VALUES (6
		 , 'Środki przeciwbólowe'
		 , 0
		 ); 
INSERT INTO products_category
 VALUES (7
		 , 'Leki Przeciwastmatyczny'
		 , 5
		 ); 
INSERT INTO products_category
 VALUES (8
		 , 'Problemy skórne'
		 , 0
		 ); 
INSERT INTO products_category
 VALUES (9
		 , 'Układ sercowo-naczyniowy'
		 , 8
		 ); 
INSERT INTO products_category
 VALUES (10
		 , 'Leki przeciwpadaczkowe'
		 , 23
		 ); 
INSERT INTO products_category
 VALUES (11
		 , 'Krople do oczu'
		 , 0
		 ); 
 
INSERT INTO products_category
 VALUES (12
		 , 'Suplementy diety'
		 , 0
		 ); 
		 
INSERT INTO products_category
 VALUES (14
		 , 'Probiotyki'
		 , 23
		 ); 
 
INSERT INTO products_category
 VALUES (15
		 , 'Nadciśnienie'
		 , 8
		 ); 
 
INSERT INTO products_category
 VALUES (16
		 , 'Przeciwpadaczkowy'
		 , 23
		 ); 
 
INSERT INTO products_category
 VALUES (17
		 , 'Leczenie HIV'
		 , 8
		 ); 

-- insert data into the PRODUCTS table
INSERT INTO products
 VALUES(5903329339200
		 , 'Famotydyna Ranigast 20 mg x 30 tabl powlekanych'
		 , 'Tabletka'
		 , '30'
		 , 'Famotydyna'
		 , '20mg'
		 , 100
		 , 10
		 , 'Duża ilość'
		 , 'Produkt leczniczy stosuje się w celu usunięcia objawów związanych z nadkwaśnością soku żołądkowego: - zgaga, - niestrawność','POL-T-30-223'
		 , 1
		 , to_date ('31.05.2025','DD.MM.YYYY'
		);
INSERT INTO products
 VALUES(5906320335200
		 , 'Triumeq 30 mg/600 mg/300 mg tabletki powlekane, leceznie HIV'
		 , 'Tabletka'
		 , '30'
		 , 'Dolutegravirum + Abacavir + lamiwudyny '
		 , '50mg/600mg/300mg'
		 , 'R'
		 , 90
		 , 'Dostępny na zamówienie', 'Dawkowanie: Zalecana dawka produktu Triumeq u osób dorosłych i młodzieży to jedna tabletka raz na dobę.'
		 , 'GSK-T-30-389'
		 , 17
		 , to_date ('31.05.2025', 'DD.MM.YYYY')
		 );
INSERT INTO products
 VALUES(5903330335202
		 , 'Sumilar, 10 mg + 10 mg, kapsułki twarde, 30 szt','Kapsułka'
		 , '30'
		 , 'Amlodypiny + Ramiprylu'
		 , '10mg/10mg'
		 , 50
		 , 80
		 , 'Tylko na zamówienie'
		 , 'Preparat jest wskazany w leczeniu nadciśnienia tętniczego u dorosłych'
		 , 'SDZ-KS-30-110'
		 , 15
		 , to_date ('31.10.2024', 'DD.MM.YYYY')
		 );
 
INSERT INTO products
 VALUES(5903330464702
		 , 'Multilac, synbiotyk (probiotyk + prebiotyk) kapsułki, 20 szt'
		 , 'Kapsułka'
		 , '20/63'
		 , 'Oligosacharydy'
		 , '63mg'
		 , 100
		 , 50
		 , 'Na wyczerpaniu'
		 , 'Preparat jest suplementem diety, nie może być stosowany jako substytut (zamiennik) zróżnicowanej diety.'
		 , 'USP-KS-20-220'
		 , 14
		 , to_date ('31.10.2024', 'DD.MM.YYYY')
		 );
INSERT INTO products
 VALUES(5903329105202
		 , 'Octenisept, płyn bakteriobójczy na skórę, 250 ml (atomizer)'
		 , 'Płyn'
		 , '250'
		 , 'Oktenidyna dichlorowodoru + fenoksyetanol', '250mg/5mg'
		 , 50
		 , 40
		 , 'Duża ilość'
		 , 'Octenisept przeznaczony jest do krótkich zabiegów antyseptycznych wiązanych z raną, błoną śluzową i graniczącą z nią skórą'
		 , 'SM-P-250-101'
		 , 8
		 , to_date ('31.07.2024', 'DD.MM.YYYY')
		 );
INSERT INTO products
 VALUES(5903330339944
		 , 'Ibuprom Max, 400 mg tabletki drażowane, 12 szt'
		 , 'Tabletka'
		 , '12'
		 , 'Ibuprofen'
		 , '400mg'
		 , 100
		 , 5
		 , 'Duża ilość'
		 , 'Bóle różnego pochodzenia w tym: bóle głowy, migreny, bóle menstruacyjne, bóle zębów, bóle mięśni, kości i stawów, bóle krzyża, bóle pourazowe, nerwobóle, rwa kulszowa. '
		 , 'USP-T-12-223'
		 , 6
		 , to_date('31.05.2025', 'DD.MM.YYYY'
		 );																		 													   
INSERT INTO products
 VALUES(5903330332009
		 , 'ACC 200 mg 100 tabletek musujących'
		 , 'Tabletka'
		 , '100'
		 , 'Acetylocysteina'
		 , '200mg'
		 , 'R'
		 , 21
		 , 'Średnia ilość'
		 , 'Lek ACC stosuje się krótkotrwale jako lek rozrzedzający wydzielinę dróg oddechowych utatwiający jej odkrztuszanie u pacjentów z objawami zakażenia w obrębie górnych dróg oddechowych.'
		 , 'SDZ-T-100-112'
		 , 6
		 , to_date ('31.05.2025', 'DD.MM.YYYY')
		 );
INSERT INTO products
  VALUES(5903331119202
		  , 'Potazek+ x 100 kaps o zmodyfikowanym uwalnianiu, na lepsze ciśnienie krwi'
		  , 'Kapsułka'
		  , '100'
		  , 'Chlorek potasu'
		  , ''
		  , 100
		  , 20
		  , 'Duża ilość'
		  , 'Potas wspiera utrzymanie prawidłowe ciśnienia krwi, wpływa na prawidłowe funkcjonowanie układu nerwowego,'
		  , 'AP-KS-100-304'
		  , 12
		  , to_date ('31.10.2024', 'DD.MM.YYYY')
		  ); 
INSERT INTO products
 VALUES(5903330311192
		 , 'Oeparol Everyday Pomadka ochronna do Ust 4,8g'
		 , 'Pomadka'
		 , '4.8'
		 , ''
		 , ''
		 , 0
		 , 0
		 , 'Duża ilość'
		 , 'Nawilża oraz optymalnie natłuszcza usta, zapobiegając ich przesuszaniu i pierzchnięciu', 'AP-PD-4.8-300'
		 , 3
		 , to_date ('25.05.2023', 'DD.MM.YYYY'
		 );	
INSERT INTO products
VALUES(5903330329374
		 , 'Hialeye Duo, intensywnie nawilżające krople do oczu, 10 ml'
		 , 'Krople'
		 , '10'
		 , 'Hialuronian'
		 , '0.2%'
		 , 0
		 , 0
		 , 'Tylko na zamówienie'
		 , 'Zalecane są do stosowania w przypadku zespołu suchego oka. '
		 , 'AP-KP-10-445'
		 , 11
		 , to_date ('31.10.2025', 'DD.MM.YYYY')
		 );
INSERT INTO products
VALUES(5909330328374
		, 'Egzysta 75 mg 56 kapsułek twardych, zaburzenia lekowe'
		,'Kapsułka'
		, '56'
		, 'Pregabalina'
		, '75mg'
		, 'R'
		, 50
		, 'Dostępny na zamówienie'
		, 'Kapsułki stosowane są w leczeniu: skojarzonym napadów padaczkowych częściowych, które są lub nie są wtórnie uogólnione, uogólnionych zaburzeń lękowych'
		, 'AP-KS-56-820'
		, 16
		, to_date ('31.10.2024', 'DD.MM.YYYY')
		);
INSERT INTO products
 VALUES(5903330329322
		 , 'Amlozek 5 mg 60 tabletek - ciśnienie tętnicze'
		 , 'Tabletka'
		 , '60'
		 , 'Amlodypina'
		 , '5mg'
		 , 'R'
		 , 35
		 , 'Tylko na zamówienie'
		 , 'Leczenie nadciśnienia tętniczego. Leczenie niedokrwienia mięśnia sercowego'
		 , 'AP-T-60-772'
		 , 15
		 , to_date ('31.05.2025', 'DD.MM.YYYY')
		 );
INSERT INTO products
 VALUES(5903330329222
		 , 'Clotrimazolum Medana, 10 mg/ml, płyn na skórę, 15 ml'
		 , 'Płyn'
		 , '15'
		 , 'Klotrymazol'
		 , '10mg'
		 , 'R'
		 , 44
		 , 'Duża ilość'
		 , 'Clotrimazolum Medana to produkt leczniczy o działaniu przeciwgrzybiczym (grzybostatycznym i grzybobójczym) skierowanym przeciw dermatofitom, drożdżakom, pleśniom'
		 , 'POL-P-15-882'
		 , 8
		 , to_date( '31.07.2024', 'DD.MM.YYYY') 
		 );
INSERT INTO products
VALUES(5903330321103
		, 'Atrodil, 20 mcg/dawkę, aerozol inhalacyjny, 10 ml (200 dawek)'
		, 'Roztwór'
		, '10'
		, 'Bromek ipratropium'
		, '20mg'
		, 50
		, 50
		, 'Dostępny na zamówienie'
		, 'Działa rozkurczająco na oskrzela. Stosuje się go w przypadku chorób takich jak przewlekła obturacyjna choroba płuc (POChP) obejmującej przewlekłe zapalenie oskrzeli i rozedmę płuc oraz w astmie oskrzelowej'
		, 'POL-R-10-002'
		, 9
		, to_date ('25.02.2023','DD.MM.YYYY')
		);
INSERT INTO products
VALUES(5903330322345
		, 'Polopiryna Max, 500 mg, tabletki dojelitowe, 20 szt.'
		, 'Tabletka'
		, '20'
		, 'Kwas acetylosalicylowy'
		, '500mg'
		, 0
		, 0
		, 'Duża ilość'
		, 'Lek Polopiryna MAX należy przyjmować doustnie podczas lub po posiłku. Tabletki należy połykać w całości, popijając dużą ilością płynu.'
		, 'POL-T-20-991'
		, 6
		, to_date ('31.05.2025', 'DD.MM.YYYY')
		);
INSERT INTO products
 VALUES(5903330344440
		 , 'Oxazepam Espefa, 10 mg, tabletki, 20 szt, na leczenie depresji'
		 , 'Tabletka'
		 , '20'
		 , 'Oksazepam'
		 , '10mg'
		 , 3.20
		 , 80
		 , 'Średnia ilość'
		 , 'Lek Oxazepam GSK stosowany jest w leczeniu stanów lękowych, objawów nagłego odstawienia alkoholu oraz wspomagająco w leczeniu niepokoju związanego z depresją.'
		 , 'GSK-T-20-993'
		 , 4
		 , to_date ('31.05.2025', 'DD.MM.YYYY')
		 );
INSERT INTO products
 VALUES(5903330329991
		 , 'Biotebal Max 10 mg - 30 tabl. Na wypadanie włosów'
		 , 'Tabletka'
		 , '30'
		 , 'Biotyna'
		 , '10mg'
		 , 0
		 , 0
		 , 'Duża ilość'
		 , 'Lek BIOTEBAL MAX stosuje się w leczeniu niedoboru biotyny z takimi objawami jak: wypadanie włosów, zaburzenia wzrostu włosów i paznokci'
		 , 'POL-T-30-011'
		 , 12
		 , to_date ('31.05.2025', 'DD.MM.YYYY')
		 );
INSERT INTO products
 VALUES(5903330322207
		 , 'Imigran, 50 mg, tabletki powlekane, 2 szt, 1 blister'
		 , 'Tabletka'
		 , '2'
		 , 'Sumatryptan'
		 , '50mg'
		 , 50
		 , 80
		 , 'Dostępny na zamówienie'
		 , 'Ostre napady migreny'
		 , 'GSK-T-2-910'
		 , 4
		 , to_date ('31.05.2025', 'DD.MM.YYYY')
		 );
INSERT INTO products
 VALUES(5903331199374
		 , 'Dermovate maść 0,5 mg/g 25 g (tuba)'
		 , 'Maść'
		 , '25'
		 , 'Propionian klobetazolu'
		 , '0.5mg'
		 , 100
		 , 50
		 , 'Duża ilość'
		 , 'Wskazania do stosowania: krótkotrwałe leczenie opornych na inne leki chorób skóry, takich jak łuszczyca, liszaj płaski, toczeń rumieniowaty - postać skórna, nawracający wyprysk oraz inne stany'
		 , 'GSK-K-25-445'
		 , 3
		 , to_date( '31.08.2026', 'DD.MM.YYYY')
		 );
INSERT INTO products
 VALUES(5903440329374
		 , 'AVODART 0,5 mg - 30 kapsułek miękkich na leczenie gruczołu krokowego'
		 , 'Kapsułka'
		 , '60'
		 , 'Dutasteryd'
		 , '0.5mg'
		 , 50
		 , 40
		 , 'Tylko na zamówienie'
		 , 'Leczenie umiarkowanych i ciężkich objawów łagodnego rozrostu gruczołu krokowego'
		 , 'GSK-KS-60-694'
		 , 2
		 , to_date ('31.10.2024', 'DD.MM.YYYY')
		 );

--insert data into the RESERVATIONS table

INSERT INTO reservations (reservation_id, booking_start, booking_end)
VALUES (
        , to_date('10.03.2022','DD.MM.YYYY')
        , to_date('17.03.2022','DD.MM.YYYY')
        );
         
INSERT INTO reservations (reservation_id, status_reservation)
VALUES (
        ,'ANULOWANIE');
 
INSERT INTO reservations
VALUES (
        , to_date('01.08.2022','DD.MM.YYYY')
        , to_date('08.08.2022','DD.MM.YYYY')
        , 'ZREALIZOWANA');
        
--insert data into the ITEMS_RESERVATION table
INSERT INTO items_reservation
VALUES (1
		, 10012
		, 100
		, 5903330311192
		, 2,
		 'szt.');
		 
INSERT INTO items_reservation
VALUES (2
		, 10012
		, 100
		, 5903330344440
		, 2
		, 'szt.');
    		 
INSERT INTO items_reservation
VALUES (1
		, 10014
		, 101
		, 5903330332009
		, 2
		, 'szt.');	
        
INSERT INTO items_reservation
VALUES (2
		, 10014
		, 101
		, 5903329105202
		, 2
		, 'szt.');
        
INSERT INTO items_reservation
VALUES (1
		, 10016
		, 102
		, 5903330311192
		, 2
		, 'szt.');
    		 
INSERT INTO items_reservation
VALUES (2
		, 10016
		, 102
		, 5903330329374
		, 2
		, 'szt.');


--insert data into the ORDERS table
INSERT INTO orders 
VALUES (10333333
		, to_date('12.11.2022','DD.MM.YYYY')
		, 10
		, 210.2
		, 'WYSŁANE'
		, 2
		, 1
		);
		
INSERT INTO orders 
VALUES (10555433
		, to_date('01.11.2022','DD.MM.YYYY')
		, 12
		, 200
		, 'OPŁACONE'
		, 3
		, 1
);

INSERT INTO orders 
VALUES (10333999
		, to_date('09.11.2022','DD.MM.YYYY')
		, 12
		, 250
		, 'WYSŁANE'
		, 1
		, 3
);


--insert data into the ITEMS_ORDER.STORE table
INSERT INTO "ITEMS_ORDER.STORE"
VALUES (1
		, 10333333
		, 5903330321103
		, 70.5
		, 2
		, 'szt.'
		, 101
		);
INSERT INTO "ITEMS_ORDER.STORE"
VALUES (2
		, 10333333
		, 5903330322207
		, 30.5
		, 3
		, 'szt.'
		, 101
		 );
		 
INSERT INTO "ITEMS_ORDER.STORE"
VALUES (1
		, 10555433
		, 5903440329374
		, 20.5
		, 2
		, 'szt.'
		, 101
		);
		
INSERT INTO "ITEMS_ORDER.STORE"
VALUES (2
		, 10555433
		, 5903330321103
		, 70.5
		, 2
		, 'szt.'
		, 107
		);

--insert data into the OPERATIONS_MAGAZINE table

INSERT INTO OPERATIONS_MAGAZINE 
VALUES ('PWE50'
		, to_date('01.03.2022','DD.MM.YYYY')
		, 5
		, 'szt.'
		, 90
		, 'AP-KS-56-820'
		, 'PZ'
		);

INSERT INTO OPERATIONS_MAGAZINE 
VALUES ('AWD15'
		, to_date('01.03.2022','DD.MM.YYYY')
		, 12
		, 'szt.'
		, 20
		, 'GSK-T-20-993'
		, 'PZ'
		);

--insert data into the ITEMS_ORDER.MAGAZINE table
INSERT INTO "ITEMS_ORDER.MAGAZINE" 
VALUES (1
		, 10333999
		, 'AP-KS-56-820'
		, 90
		, 5
		, 'szt.'
		, 3
		, 'PWE50'
		);
INSERT INTO "ITEMS_ORDER.MAGAZINE" 
VALUES (2
		, 10333999
		, 'GSK-T-20-993'
		, 20
		, 12
		, 'szt.'
		, 1
		, 'AWD15'
		);

--insert data into the ITEMS.STOCK table
INSERT INTO  items_stock
VALUES (1
		, 'GSK-T-20-993'
		, 1
		, 88976
		);
INSERT INTO items_stock
VALUES (2
		, 'GSK-T-20-993'
		, 5
		, 19332
		);
INSERT INTO items_stock
VALUES (3
		, 'GSK-T-20-993'
		, 4
		, 19300
		);
   
INSERT INTO items_stock
VALUES (1
		, 'GSK-T-30-389'
		, 1
		, 32223
		);   
        
INSERT INTO items_stock
VALUES (2
		, 'GSK-T-30-389'
		, 3
		, 22313 
		); 
    
INSERT INTO items_stock
VALUES (1
		, 'AP-T-60-772'
		, 1
		, 44434
		);   
       
INSERT INTO items_stock
VALUES (2
		, 'AP-T-60-772'
		, 4
		, 12567
		); 
         
INSERT INTO items_stock
VALUES (1
		, 'POL-P-15-882'
		, 5
		, 66651
		);   
       
INSERT INTO items_stock
VALUES (2
		, 'POL-P-15-882'
		, 3
		, 99845
		);         
      
INSERT INTO items_stock
VALUES (1
		, 'POL-R-10-002'
		, 1
		, 43457
		);   
       
INSERT INTO items_stock
VALUES (2
		, 'POL-R-10-002'
		, 3
		, 12777
		);         
      
INSERT INTO items_stock
VALUES (1
		, 'POL-T-20-991'
		, 1
		, 99832
		);   
       
INSERT INTO items_stock
VALUES (2
		, 'POL-T-20-991'
		, 3
		, 12332
		);         
       
INSERT INTO items_stock
VALUES (1
		, 'POL-T-30-011'
		, 5
		, 433321
		);   
       
INSERT INTO items_stock
VALUES (2
		, 'POL-T-30-011'
		, 3
		, 11124
		);         
       
INSERT INTO items_stock
VALUES (1
		, 'GSK-T-2-910'
		, 1
		, 56544
		);   
       
INSERT INTO items_stock
VALUES (2
		, 'GSK-T-2-910'
		, 3
		, 33345
		);         
       
INSERT INTO items_stock
VALUES (1
		, 'GSK-K-25-445'
		, 1
		, 33321 
		);   
       
INSERT INTO items_stock
VALUES (2
		, 'GSK-K-25-445'
		, 3
		, 11132
		);         
      
INSERT INTO items_stock
VALUES (1
		, 'GSK-KS-60-694'
		, 1
		, 45667 
		);   
       
INSERT INTO items_stock
VALUES (2
		, 'GSK-KS-60-694'
		, 2
		, 10097
		);         
       
INSERT INTO items_stock
VALUES (1
		, 'AP-KS-56-820'
		, 1
		, 56667
		);   
       
INSERT INTO items_stock
VALUES (2
		, 'AP-KS-56-820'
		, 3
		, 32322
		);         
      
INSERT INTO items_stock
VALUES (1
		, 'AP-PD-4.8-300'
		, 1
		, 99843
		);   
       
INSERT INTO items_stock
VALUES (2
		, 'AP-PD-4.8-300'
		, 5
		, 11101
		);                
--insert data into the INVOICES table
INSERT INTO invoices 
VALUES ('832208/AB/09/2022'
		, to_date('13.02.2022','DD.MM.YYYY')
		, 33
		, 'szt.'
		, 232.23
		, 1
		, 80.2
		, 100.2 
		);

--insert data into the ITEMS_INVOICE table
INSERT INTO items_invoice 
VALUES (1
		, '832208/AB/09/2022'
		, 5906320335200
		, 46.2
		, 'Triumeq 30 mg/600 mg/300 mg tabletki powlekane leczenie HIV'
		, 2
		, 'szt.'
		, 23
		, 8
		);
INSERT INTO items_invoice 
VALUES (2
		, '832208/AB/09/2022'
		, 5903330321103
		, 26.2
		, 'Atrodil, 20 mcg/dawkę, aerozol inhalacyjny, 10 ml (200 dawek)'
		, 1
		, 'szt.'
		, 13
		, 8
		);
INSERT INTO items_invoice 
VALUES (3
		, '832208/AB/09/2022'
		, 5903330344440
		, 31.2
		, 'Oxazepam Espefa, 10 mg, tabletki, 20 szt, na leczenie depresji'
		, 2
		, 'szt.'
		, 33
		, 8
		);




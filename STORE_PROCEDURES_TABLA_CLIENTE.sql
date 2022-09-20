USE aries;

DELIMITER //
CREATE PROCEDURE SP_CLIENTELISTAR()
BEGIN
SELECT * 
FROM CLIENTE 
ORDER BY IDCTE, IDMEDIO, IDCTO, NOMBRE;
END
//
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS SP_CLIENTEINSERTAR;
CREATE PROCEDURE SP_CLIENTEINSERTAR(	
   in _idMedio int(10),   
   in _idCto int(10),    
   in _nombre varchar(60),    
   in _apellido_paterno varchar(50),   
   in _apellido_materno varchar(50),    
   in _sexo varchar(1),    
   in _edo_civil varchar(20),   
   in _residencia char(10),   
   in _retIsr char(1),    
   in _rfc varchar(13),    
   in _fechaNa varchar(30),    
   in _curp varchar(40), 
   in _nacionalidad varchar(30),   
   in _telCasa varchar(40),   
   in _celular varchar(30),    
   in _telOficina varchar(40),     
   in _telOtro varchar(20) ,   
   in _nextel varchar(40),    
   in _fax1 varchar(30) ,    
   in _email1 varchar(40),     
   in _email2 varchar(40) ,   
   in _email3 varchar(40) ,   
   in _web varchar(60),     
   in _tipo varchar(5),   
   in _fecha_creacion datetime ,
   in _creado_por int(10) , 
   in _fechaAn varchar(30) ,   
   in _idZoho varchar(30) ,   
   in _entidadNacimiento varchar(45)  ,  
   in _ciudadNacimiento varchar(45) ,   
   in _paisNacimiento varchar(45)
)
BEGIN
	INSERT INTO CLIENTE (idMedio ,   idCto ,   nombre,   apellido_paterno,   apellido_materno,  sexo ,  edo_civil,  residencia ,  retIsr ,  rfc ,  fechaNa ,  curp ,  nacionalidad ,  telCasa ,  celular ,  telOficina ,  telOtro,  nextel ,  fax1 ,  email1 ,  email2 ,  email3 ,  web,  tipo,  fecha_creacion,
  creado_por ,  fechaAn ,  idZoho ,  entidadNacimiento,  ciudadNacimiento,  paisNacimiento) VALUES (_idMedio , _idCto , _nombre , _apellido_paterno ,  _apellido_materno , _sexo , _edo_civil , _residencia , _retIsr , _rfc , _fechaNa , _curp , _nacionalidad , _telCasa , _celular , _telOficina , _telOtro  , 
   _nextel , _fax1  , _email1 , _email2  , _email3  , _web , _tipo , _fecha_creacion , _creado_por  , _fechaAn  , _idZoho  , _entidadNacimiento   , _ciudadNacimiento  , _paisNacimiento );
END
//
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS SP_CLIENTEACTUALIZAR;
CREATE PROCEDURE SP_CLIENTEACTUALIZAR(
   in _idCte int(10),   
   in _idMedio int(10),   
   in _idCto int(10),    
   in _nombre varchar(60),    
   in _apellido_paterno varchar(50),   
   in _apellido_materno varchar(50),    
   in _sexo varchar(1),    
   in _edo_civil varchar(20),   
   in _residencia char(10),   
   in _retIsr char(1),    
   in _rfc varchar(13),    
   in _fechaNa varchar(30),    
   in _curp varchar(40), 
   in _nacionalidad varchar(30),   
   in _telCasa varchar(40),   
   in _celular varchar(30),    
   in _telOficina varchar(40),     
   in _telOtro varchar(20) ,   
   in _nextel varchar(40),    
   in _fax1 varchar(30) ,    
   in _email1 varchar(40),     
   in _email2 varchar(40) ,   
   in _email3 varchar(40) ,   
   in _web varchar(60),     
   in _tipo varchar(5),   
   in _fecha_creacion datetime ,
   in _creado_por int(10) , 
   in _fechaAn varchar(30) ,   
   in _idZoho varchar(30) ,   
   in _entidadNacimiento varchar(45)  ,  
   in _ciudadNacimiento varchar(45) ,   
   in _paisNacimiento varchar(45)
)
BEGIN
	UPDATE CLIENTE SET idMedio = _idMedio, idCto = _idCto, nombre = _nombre,  apellido_paterno = _apellido_paterno,  apellido_materno = _apellido_materno,  sexo = _sexo ,  edo_civil = _edo_civil,  residencia = _residencia ,  retIsr = _retIsr,  rfc = _rfc ,  fechaNa = _fechaNa ,  curp = _curp ,  nacionalidad = _nacionalidad ,  telCasa = _telCasa ,  celular = _celular ,  telOficina = _telOficina ,  telOtro = _telOtro,  nextel = _nextel ,  fax1 = _fax1 ,  email1 = _email1,  email2 = _email2 ,  email3 = _email3 ,  web = _web,  tipo = _tipo,  fecha_creacion = _fecha_creacion,
  creado_por = _creado_por ,  fechaAn = _fechaAn ,  idZoho = _idZoho ,  entidadNacimiento = _entidadNacimiento,  ciudadNacimiento = _ciudadNacimiento,  paisNacimiento = _paisNacimiento
  WHERE idCte = _idCte;

END
//
DELIMITER ;


DELIMITER //
DROP PROCEDURE IF EXISTS SP_CLIENTEELIMINAR;
CREATE PROCEDURE SP_CLIENTEELIMINAR(
   in _idCte int(10)
)
BEGIN
	DELETE FROM CLIENTE WHERE idCte = _idCte;
END
//
DELIMITER ;








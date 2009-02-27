function limitaCaracteres(obj, len){
	if( event.keyCode != 9 && event.keyCode != 8 && event.keyCode != 46 && event.keyCode != 18 && event.keyCode != 17 && event.keyCode != 20 && event.keyCode != 16 && event.keyCode != 38 && event.keyCode != 40 && event.keyCode != 37 && event.keyCode != 39 && event.keyCode != 36 && event.keyCode != 35 ){	
		if( obj.value.length > len ){
			alert( 'Limite de caracteres excedido' )
			return false
		}
	}
}
function notAcessValidate(value){
	var IdUser = document.getElementById( 'Topo1_txtIdUser' );
	if( IdUser.value != 1 && value != -1  ){
		alert('Seu usuario nao tem permissao para acessar esta pagina');
		return false
	}
	return true
}

function notAcessNotIndexOf(){
	var IdUser = document.getElementById( 'Topo1_txtIdUser' );
	if( IdUser.value != 1 ){
		alert('Seu usuario nao tem permissao para executar esta acao');
		return false
	}
	return true
}

function notAcess(value){
	var IdUser = document.getElementById( 'Topo1_txtIdUser' );
	if( IdUser.value != 1 && value != -1  ){
		alert('Seu usuario nao tem permissao para acessar esta pagina');
		history.go(-1);
		return false
	}
	return true
}

function Compara_Data(obj1, obj2)
{
	if( obj1.value != "" && obj2.value != "" )
	{
		if( obj1.value > obj2.value )
		{
			alert('Data inicial maior que a data final.');
			return false;
		}
		else
		{
			return true;
		}
	}
	else
	{
		return true;
	}
}	


function Verifica_data(campo)
{
	if( campo.value != "" )
	{
		erro=0;
		hoje = new Date();
		anoAtual = hoje.getFullYear();
		barras = campo.value.split("/");

		if (barras.length == 3)
		{
				dia = barras[0];
				mes = barras[1];
				ano = barras[2];
				//resultado = (!isNaN(dia) && (dia > 0) && (dia < 32)) && (!isNaN(mes) && (mes > 0) && (mes < 13)) && (!isNaN(ano) && (ano.length == 4) && (ano <= anoAtual && ano >= 1900));
				resultado = (!isNaN(dia) && (dia > 0) && (dia < 32)) && (!isNaN(mes) && (mes > 0) && (mes < 13)) && (!isNaN(ano) && (ano.length == 4) && (ano <= ( anoAtual + 5 ) && ano >= 1900));
				if (!resultado) 
				{
							alert("Formato de data invalido!");
							campo.value = "";
							campo.focus();
							return false;
				}
				else
				{
					return true;
				}
		} 
		else 
		{
				alert("Formato de data invalido!");	
				campo.value = "";
				campo.focus();		
				return false;
		}
	}
	else
	{
		return false
	}
}

function AddItem( idSend, idRecep ){    
	objRecep = document.getElementById( idRecep );
	objSend = document.getElementById( idSend );
	var len = objRecep.length;
	var lens = objSend.length;    
				
	for( var i = 0; i < lens; i++ ) {
		if ( objSend.options[i].selected ) {
           if( len > 0 ){
               
				for( var count = 0; count < len; count++ ) {
                    if( objSend.options[i].value != objRecep.options[count].value ){
                        
						var obj = document.createElement("OPTION")
						obj.value = objSend.options[i].value;
						obj.text  = objSend.options[i].text;
                        
						objRecep.appendChild( obj );
						objSend.options[i] = null;							
						delete obj
						len++;
						lens--;	
						i--;						
						break				
					}
					if( lens == 0 )	break;
				}
			}
			else{
				var obj = document.createElement("OPTION")
				obj.value = objSend.options[i].value;
				obj.text  = objSend.options[i].text;
				objRecep.appendChild( obj );
				
				objSend.options[i] = null;							
				delete obj
				len++;
				lens--;	
				i--;
			}
		}
	}
}

function checkedAll( list ){
	objRecep = document.getElementById( list );
	if( objRecep ){
		var len = objRecep.options.length;
		for(var i = (len-1); i >= 0; i--) {
			if ( ( objRecep.options[i] != null ) ) {
				objRecep.options[i].selected = true;
			}
		}
	}
}

function GetIdade( data ){
	var now		= new Date();
	var idate = now.getYear() - data.substr(6,4);
	return  idate
}

function Verifica_Data(data, obrigatorio){   
//Se o par�metro obrigat�rio for igual � zero, significa que elepode estar vazio, caso contr�rio, n�o   
 var data = document.getElementById(data);   
    var strdata = data.value;   
    if((obrigatorio == 1) || (obrigatorio == 0 && strdata != "")){   
        //Verifica a quantidade de digitos informada esta correta.   
        if (strdata.length != 10){   
            alert("Formato da data n�o � v�lido. Formato correto:   - dd/mm/aaaa.");   
            data.focus();   
            return false  
        }   
        //Verifica m�scara da data   
        if ("/" != strdata.substr(2,1) || "/" != strdata.substr(5,1)){   
            alert("Formato da data n�o � v�lido.   Formato correto:   - dd/mm/aaaa.");   
            data.focus();   
            return false  
        }   
        dia = strdata.substr(0,2)   
        mes = strdata.substr(3,2);   
        ano = strdata.substr(6,4);   
        //Verifica o dia   
        if (isNaN(dia) || dia > 31 || dia < 1){   
            alert("Formato do dia n�o � v�lido.");   
            data.focus();   
            return false  
        }   
        if (mes == 4 || mes == 6 || mes == 9 || mes == 11){   
            if (dia == "31"){   
                alert("O m�s informado n�o possui 31 dias.");   
                data.focus();   
                return false  
            }   
        }   
        if (mes == "02"){   
            bissexto = ano % 4;   
            if (bissexto == 0){   
                if (dia > 29){   
                    alert("O m�s informado possui somente 29 dias.");   
                    data.focus();   
                    return false  
                }   
            }else{   
                if (dia > 28){   
                    alert("O m�s informado possui somente 28 dias.");   
                    data.focus();   
                    return false  
                }   
            }   
        }   
    //Verifica o m�s   
        if (isNaN(mes) || mes > 12 || mes < 1){   
            alert("Formato do m�s n�o � v�lido.");   
            data.focus();   
            return false  
        }   
        //Verifica o ano   
        if (isNaN(ano)){   
            alert("Formato do ano n�o � v�lido.");   
            data.focus();   
            return false  
        }   
    }   
} 


function Compara_Datas(data_inicial, data_final){ 	
    dia_inicial      = data_inicial.substr(0,2);       
    dia_final        = data_final.substr(0,2);   
    mes_inicial      = data_inicial.substr(3,2);   
    mes_final        = data_final.substr(3,2);   
    ano_inicial      = data_inicial.substr(6,4);   
    ano_final        = data_final.substr(6,4); 
        
    if(ano_inicial > ano_final){   
        return false  
    }else{   
     if(ano_inicial == ano_final){   
      if(mes_inicial > mes_final){   
			return false  
            }else{   
                if(mes_inicial == mes_final){   
                    if(dia_inicial > dia_final){   
                       return false  
                    }   
                }   
            }   
        }   
    }   
}   

var MONTH_NAMES=new Array('January','February','March','April','May','June','July','August','September','October','November','December','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');
var DAY_NAMES=new Array('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sun','Mon','Tue','Wed','Thu','Fri','Sat');
function LZ(x) {return(x<0||x>9?"":"0")+x}


function parseDate(val) {
	var preferEuro=(arguments.length==2)?arguments[1]:false;
	generalFormats=new Array('y-M-d','MMM d, y','MMM d,y','y-MMM-d','d-MMM-y','MMM d');
	monthFirst=new Array('M/d/y','M-d-y','M.d.y','MMM-d','M/d','M-d');
	dateFirst =new Array('d/M/y','d-M-y','d.M.y','d-MMM','d/M','d-M');
	var checkList=new Array('generalFormats',preferEuro?'dateFirst':'monthFirst',preferEuro?'monthFirst':'dateFirst');
	var d=null;
	for (var i=0; i<checkList.length; i++) {
		var l=window[checkList[i]];
		for (var j=0; j<l.length; j++) {
			d=getDateFromFormat(val,l[j]);
			if (d!=0) { return new Date(d); }
		}
	}
	return null;
}

function compareDates(date1,dateformat1,date2,dateformat2) {
	var d1=getDateFromFormat(date1,dateformat1);
	var d2=getDateFromFormat(date2,dateformat2);
	if (d1==0 || d2==0) {
		return -1;
		}
	else if (d1 > d2) {
		return 1;
		}
	return 0;
	}


function _isInteger(val) {
	var digits="1234567890";
	for (var i=0; i < val.length; i++) {
		if (digits.indexOf(val.charAt(i))==-1) { return false; }
		}
	return true;
	}
function _getInt(str,i,minlength,maxlength) {
	for (var x=maxlength; x>=minlength; x--) {
		var token=str.substring(i,i+x);
		if (token.length < minlength) { return null; }
		if (_isInteger(token)) { return token; }
		}
	return null;
	}


function getDateFromFormat(val,format) {
	val=val+"";
	format=format+"";
	var i_val=0;
	var i_format=0;
	var c="";
	var token="";
	var token2="";
	var x,y;
	var now=new Date();
	var year=now.getYear();
	var month=now.getMonth()+1;
	var date=1;
	var hh=now.getHours();
	var mm=now.getMinutes();
	var ss=now.getSeconds();
	var ampm="";
	
	while (i_format < format.length) {
		// Get next token from format string
		c=format.charAt(i_format);
		token="";
		while ((format.charAt(i_format)==c) && (i_format < format.length)) {
			token += format.charAt(i_format++);
			}
		// Extract contents of value based on format token
		if (token=="yyyy" || token=="yy" || token=="y") {
			if (token=="yyyy") { x=4;y=4; }
			if (token=="yy")   { x=2;y=2; }
			if (token=="y")    { x=2;y=4; }
			year=_getInt(val,i_val,x,y);
			if (year==null) { return 0; }
			i_val += year.length;
			if (year.length==2) {
				if (year > 70) { year=1900+(year-0); }
				else { year=2000+(year-0); }
				}
			}
		else if (token=="MMM"||token=="NNN"){
			month=0;
			for (var i=0; i<MONTH_NAMES.length; i++) {
				var month_name=MONTH_NAMES[i];
				if (val.substring(i_val,i_val+month_name.length).toLowerCase()==month_name.toLowerCase()) {
					if (token=="MMM"||(token=="NNN"&&i>11)) {
						month=i+1;
						if (month>12) { month -= 12; }
						i_val += month_name.length;
						break;
						}
					}
				}
			if ((month < 1)||(month>12)){return 0;}
			}
		else if (token=="EE"||token=="E"){
			for (var i=0; i<DAY_NAMES.length; i++) {
				var day_name=DAY_NAMES[i];
				if (val.substring(i_val,i_val+day_name.length).toLowerCase()==day_name.toLowerCase()) {
					i_val += day_name.length;
					break;
					}
				}
			}
		else if (token=="MM"||token=="M") {
			month=_getInt(val,i_val,token.length,2);
			if(month==null||(month<1)||(month>12)){return 0;}
			i_val+=month.length;}
		else if (token=="dd"||token=="d") {
			date=_getInt(val,i_val,token.length,2);
			if(date==null||(date<1)||(date>31)){return 0;}
			i_val+=date.length;}
		else if (token=="hh"||token=="h") {
			hh=_getInt(val,i_val,token.length,2);
			if(hh==null||(hh<1)||(hh>12)){return 0;}
			i_val+=hh.length;}
		else if (token=="HH"||token=="H") {
			hh=_getInt(val,i_val,token.length,2);
			if(hh==null||(hh<0)||(hh>23)){return 0;}
			i_val+=hh.length;}
		else if (token=="KK"||token=="K") {
			hh=_getInt(val,i_val,token.length,2);
			if(hh==null||(hh<0)||(hh>11)){return 0;}
			i_val+=hh.length;}
		else if (token=="kk"||token=="k") {
			hh=_getInt(val,i_val,token.length,2);
			if(hh==null||(hh<1)||(hh>24)){return 0;}
			i_val+=hh.length;hh--;}
		else if (token=="mm"||token=="m") {
			mm=_getInt(val,i_val,token.length,2);
			if(mm==null||(mm<0)||(mm>59)){return 0;}
			i_val+=mm.length;}
		else if (token=="ss"||token=="s") {
			ss=_getInt(val,i_val,token.length,2);
			if(ss==null||(ss<0)||(ss>59)){return 0;}
			i_val+=ss.length;}
		else if (token=="a") {
			if (val.substring(i_val,i_val+2).toLowerCase()=="am") {ampm="AM";}
			else if (val.substring(i_val,i_val+2).toLowerCase()=="pm") {ampm="PM";}
			else {return 0;}
			i_val+=2;}
		else {
			if (val.substring(i_val,i_val+token.length)!=token) {return 0;}
			else {i_val+=token.length;}
			}
		}
	// If there are any trailing characters left in the value, it doesn't match
	if (i_val != val.length) { return 0; }
	// Is date valid for month?
	if (month==2) {
		// Check for leap year
		if ( ( (year%4==0)&&(year%100 != 0) ) || (year%400==0) ) { // leap year
			if (date > 29){ return 0; }
			}
		else { if (date > 28) { return 0; } }
		}
	if ((month==4)||(month==6)||(month==9)||(month==11)) {
		if (date > 30) { return 0; }
		}
	// Correct hours value
	if (hh<12 && ampm=="PM") { hh=hh-0+12; }
	else if (hh>11 && ampm=="AM") { hh-=12; }
	var newdate=new Date(year,month-1,date,hh,mm,ss);
	return newdate.getTime();
	}


function replaceAll( str , strSearch , strNew )
{
	var i = str.indexOf( strSearch );
	
	while( i > -1 )
	{
		str = str.replace( strSearch , strNew );
		i = str.indexOf( strSearch );
	}
	
	return str;
}

function isValidCPF( CPF )
{
	CPF = replaceAll( CPF , "." , "" )
	CPF = replaceAll( CPF , "-" , "" )
	
	if( CPF.length < 11 || CPF.length > 11 )
		return false;
		
	if( CPF.charAt(0) == CPF.charAt(1) && CPF.charAt(2) == CPF.charAt(3) && CPF.charAt(4) == CPF.charAt(5) && CPF.charAt(6) ==
	CPF.charAt(7) && CPF.charAt(8) == CPF.charAt(9) || CPF == "01234567890" || CPF == "98765432100" ) 
		return false;
	else
	{

		valor1=0
		
		for( cont=0;cont<9;cont++ )
			valor1 += CPF.charAt(cont) * ( 10 - cont )
		
		resto = valor1 % 11
		
		digito1 = ( resto < 2 ) ? 0 : ( 11 - resto )
				
		valor2=0	
		
		for( cont = 0;cont < 10;cont++ )
			valor2 += CPF.charAt(cont) * (11 - cont)
		
		resto = valor2 % 11
     	
     	digito2 = ( resto < 2 ) ? 0 : ( 11 - resto )
     	
 		return ( digito1 == CPF.charAt(9) && digito2 == CPF.charAt(10) )
   }
}


function formatToUper( field ){	
	field.value = field.value.toUpperCase();
}

function formatValue( field , format )  
{
		var strVerify = ""
		var retorno = false
		var key = event.keyCode;
		var keychar = String.fromCharCode( key );		
	
		for( x=0; x < format.length ; x++)
		{
			if( isNaN( format.charAt( x ) ) )
			{
				strVerify += x + "|" + format.charAt( x ) + "|"
			}
		}
	
	if( ! isNaN( keychar ) )
	  {
	  		retorno = true
			var strValue = field.value
						
	  		if( strValue.length < format.length )
			{
	  			strVerify = strVerify.split("|")
		
				for( x=0; x < ( strVerify.length - 1 ) ; x += 1)
				{
					tam = strValue.length + ""	
						if( tam == strVerify[x] )
						{
							strValue += strVerify[x+1]
							field.value = strValue
							break
						}
				}
			}
			else
				retorno = false
	  }
	  
	  return retorno
}


function fieldDecimal()
{
	var key = event.keyCode;
	var keychar = String.fromCharCode( key );
	
	if( isNaN( keychar ) && keychar != ',' && keychar != '.' )
		return false
	else 
		return true
}


function isValidForm( formName , fieldtofield , OriginalColor , modifiedColor)
{
	/*	 Fun��o para validar dinamicamente um fomul�rio criado por Leandro F Pinto
	
	********************       Como Usar       ********************
	Chame a fun��o no onsubmit do form passando os seguintes par�metros - exemplo( onsubmit="return isValidForm( this.name , true , 'white' , 'black' )" ) 
	
	1: formName - O nome do formul�rio que ser� validado
	2: Se a vewrifica��o ser� feita campo a campo ou n�o. 
		Campo a Campo valida um campo, exibe uma mensagem e para naquele campo    
		N�o Campo a Campo, valida todos os campos e exibe uma �nica mensagem
	3: A cor de fundo padr�o do campo 
	4: A cor de fundo do campo que ser� trocado se a valida��o do campo for falsa
	
	********************       Atributos para os campos       ********************
	
	validar="true" Isso indica que o campo tem que ser validado.
	msgName="nome que vc quiser" Indica o nome que ser� exibido na mensagem de valida��o
	isDate="true" Indica que o campo � do tipo data e ser� feita uma valida��o de data nesse campo
	isMail="true" Indica que o campo � do tipo E-Mail e ser� feita uma valida��o de E-Mail nesse campo
	minChar="valor" Se o campo for de senha esse atributo define o minimo de caracteres que devera ser aceito naquele campo
	maxChar="valor" Se o campo for textarea esse atributo define o max de caracters permitidos
 
 	Para validar grupos. por exemplo campo tipo radio ou checkbox que geralmente tem varios campos com mesmo nome
	So coloque o atributo validar no primeiro, nos outros n�o precisa
 		
	
	********************       Alterando mensagens       ********************
	Para alterar a mensagem padr�o que ser� exibida acrescente os seguintes campos no form
	
	<input type="hidden" name="msg" value="sua nova mensagem"> Altera a mensagem padr�o do form
	<input type="hidden" name="msgField" value="sua nova mensagem">  
		Altera a mensagem de valida��o campo a campo - Exemplo "O campo {0} deve ser preenchido"
		onde {0} significa o nome do campo. Onde voc� colocar o {0} ser� substiruido pelo nome do campo
		exemplo se o nome do campo fosse "Nome"  a mensagem "O campo {0} deve ser preenchido" ficaria assim "O campo Nome deve ser preenchido"
	<input type="hidden" name="msgSelect" value="sua nova mensagem">   Altera a mensagem de valida��o de campo tipo select. Se usado o {0} trocara pelo nome do campo
	<input type="hidden" name="msgRadio" value="sua nova mensagem">  Altera a mensagem de valida��o de campo tipo Radio. Se usado o {0} trocara pelo nome do campo	
	<input type="hidden" name="msgCheckBox" value="sua nova mensagem">  Altera a mensagem de valida��o de campo tipo CheckBox. Se usado o {0} trocara pelo nome do campo		
		
	S� altere se quiser, pois a fun��o ja tem suas mensagens padr�es	
		
	*/
	
	var isValid        = true
	var      el        = document.forms[formName].elements
	var message        = ""
	var message2       = ""
	var defaultMessage = "Campos Obrigat�rios n�o preenchidos\n"
		
	if( document.forms[formName].msg )
		defaultMessage = document.forms[formName].msg.value + "\n"
		
	if( fieldtofield ) // se for validado campo a campo, trocar a cor de fundo de todos os campos
	{
		for( x=0; x<el.length; x++ )
		{
			if( el[x].validar == "true" )
				el[x].style.background = OriginalColor
		}
	}
		
	for( x=0; x < el.length; x++ )
	{
		el[x].style.background = OriginalColor
	
		if( el[x].validar == "true" && ! el[x].disabled )
		{
			if( el[x].type == "text" || el[x].type == "password" || el[x].type == "textarea" )
			{
				if( el[x].value == "" )
				{
					el[x].style.background = modifiedColor
					
					if( ! fieldtofield )
						globalMessage( '' , 'message' )
					else
					{
						var msgField = "Fill the field " + el[x].msgName + " correctly"
							
							if( document.forms[formName].msgField )
								msgField = document.forms[formName].msgField.value.replace( "{0}", el[x].msgName )	
					
						return fieldMessage( el[x] , msgField )	
					}
				}
				else if( el[x].value.length < el[x].minChar ) // se for campo senha verifica se o valor � menor que o definido
				     {
					 		el[x].style.background = modifiedColor
					 		msgPassword = "O campo " + el[x].msgName + " deve conter no m�nimo "+ el[x].minChar + " caracteres\n"
					 
					 		if( ! fieldtofield )
								globalMessage( msgPassword , 'message2' )	
							else
								return fieldMessage( el[x] , msgPassword )							
					 }
					 else if( el[x].value.length > el[x].maxChar ) // se for textarea validar com o numero de char permitidos
					 	  {
						  		el[x].style.background = modifiedColor	  	
						        msgTextArea = "O campo " + el[x].msgName + " deve conter no m�ximo "+ el[x].maxChar + " caracteres\n" 
						  
						  		if( ! fieldtofield )
									globalMessage( msgTextArea , 'message2' )		
								else
									return fieldMessage( el[x] , msgTextArea )							
						  }
				 	 	  else if( el[x].isDate == "true" )
					 	  		{
									strData = /^(\d{1,2})(\/|-\.)(\d{1,2})\2(\d{2}|(19|20)\d{2})$/ 
									
					 	  			if( el[x].value.match( strData ) == null )
									{
										el[x].style.background = modifiedColor	  	
						  				msgData = "Invalid date in field " + el[x].msgName + "\n" 
										
						  					if( ! fieldtofield )
												globalMessage( msgData , 'message2' )		
											else
												return fieldMessage( el[x] , msgData )							
									}
						  		}
								else if( el[x].isMail == "true" )
									{
										strMail = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/
									
										if( el[x].value.match( strMail ) == null )
										{
											el[x].style.background = modifiedColor	  	
						  					msgMail = "O Campo " + el[x].msgName + " cont�m um E-Mail Inv�lido\n" 
											
						  					if( ! fieldtofield )
												globalMessage( msgMail , 'message2' )		
											else
												return fieldMessage( el[x] , msgMail )							
										}
									}
									else if( el[x].isCpf == "true" )
										{
											if( ! isValidCPF( el[x].value ) )
											{
												el[x].style.background = modifiedColor	  	
												msgCPF = "O " + el[x].msgName + " digitado � inv�lido\n" 
												
												if( ! fieldtofield )
													globalMessage( msgCPF , 'message2' )		
												else
													return fieldMessage( el[x] , msgCPF )	
											}
										}
								
			} // fecha campo tipo text ou password ou textarea
			else if( el[x].type == "select-one" )
				 {
				  		if( el[x].selectedIndex == 0 )
						{
							el[x].style.background = modifiedColor
							
							if( ! fieldtofield )
								globalMessage( '' , 'message' )
							else
							{
								var msgSelect="Selecione uma op��o no campo " + el[x].msgName
									
									if( document.forms[formName].msgSelect )
										msgSelect = document.forms[formName].msgSelect.value.replace( "{0}", el[x].msgName )
										
								return fieldMessage( el[x] , msgSelect )		
							}
						}
				}// fecha campo tipo select-one
				else if( el[x].type == "select-multiple" )
				 {
						if( el[x].selectedIndex == -1 )
						{
							el[x].style.background = modifiedColor
							
							if( ! fieldtofield )
								globalMessage( '' , 'message' )
							else
							{
								var msgSelect="Selecione uma op��o no campo " + el[x].msgName
									
									if( document.forms[formName].msgSelect )
										msgSelect = document.forms[formName].msgSelect.value.replace( "{0}", el[x].msgName )
										
								return fieldMessage( el[x] , msgSelect )		
							}
						}
				}// fecha campo tipo select-multiple 
				else if( el[x].type == "radio" )
					  {
					   		checked = false
					        elRadios = document.forms[formName][el[x].name]
					  		
							if ( typeof(elRadios.length) == "number" )
					  		{										
					  			for( i=0; i < elRadios.length; i++ )
					   			{
					   				if( elRadios[i].checked )
					   				{
					   					checked = true
					   					break
					   				}
					   			}
							}
							else if ( el[x].checked )
										checked = true
					   		
					   		if( ! checked )
					   		{
					   			el[x].style.background = modifiedColor
					   			if( ! fieldtofield )
					   				globalMessage( '' , 'message' )	
					   			else
					   			{
					   				var msgRadio="Selecione uma op��o no campo " + el[x].msgName
					   				
					   					if( document.forms[formName].msgRadio )
					   						msgRadio = document.forms[formName].msgRadio.value.replace( "{0}", el[x].msgName )
					   			
								   return fieldMessage( el[x]  , msgRadio )
					   			}
					   		}
					  } // fecha type radio
					  else if( el[x].type == "checkbox" )
					  {
					   		checked = false
					        elCheckBox = document.forms[formName][el[x].name]
					  
					  		if ( typeof(elCheckBox.length) == "number" )
							{								
					  			for( i=0; i < elCheckBox.length; i++ )
					   			{
					   				if( elCheckBox[i].checked )
					   				{
					   					checked = true
					   					break
					   				}
					   			}
					   		}
							else if ( el[x].checked )
										checked = true
																					
					   		if( ! checked )
					   		{
					   			el[x].style.background = modifiedColor
					   			if( ! fieldtofield )
								   globalMessage( '' , 'message' )	
					   			else
					   			{
					   				msgCheckBox="Selecione uma op��o no campo " + el[x].msgName
					   				
					   					if( document.forms[formName].msgCheckBox )
					   						msgCheckBox = document.forms[formName].msgCheckBox.value.replace( "{0}", el[x].msgName )
			
								   return fieldMessage( el[x]  , msgCheckBox )
					   			}
					   		}
					  } // fecha type checkbox
		} // fecha validar
	} // fecha for
	
	if( ! isValid )
	{
		alert( message + message2 )
		return false
	}
	else
		return true
	
	function fieldMessage( field, message ) // exibe mensagem campo a campo
	{
		el[x].focus()
		alert( message )
		return false
	}
	
	function globalMessage( msg , toVariable ) // exibe uma �nica mensagem depois de validar
	{
		isValid = false
		if( toVariable == "message" )
			message = defaultMessage
		else
			message2 += msg
	}	
				
} // fecha funcao
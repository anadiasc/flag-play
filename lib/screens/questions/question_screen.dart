import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
//import 'dart:convert';
//import 'package:flutter/services.dart';


class QuestionScreen extends StatefulWidget {
  final int time;

  const QuestionScreen({super.key, required this.time});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _currentIndex = 0;
  int _score = 0;
  late int _remainingTime;
  Timer? _timer;
  List<Color> _buttonColors = [];

  // Lista de perguntas (bandeira, opções e resposta correta)
  final List<Map<String, dynamic>> _questions = [
    {
            "id": 1,
            "sigla": "ad",
            "nome": "Andorra",
            "bandeira": "assets/bandeiras-paises/ad.jpg",
            "opcoes": [
                "Espanha",
                "Andorra",
                "Portugal",
                "Tailândia"
            ]
        },
        {
            "id": 2,
            "sigla": "ae",
            "nome": "Emirados Árabes Unidos",
            "bandeira": "assets/bandeiras-paises/ae.jpg",
            "opcoes": [
                "Arábia Saudita",
                "Nova Zelândia",
                "Argentina",
                "Emirados Árabes Unidos"
            ]
        },
        {
            "id": 3,
            "sigla": "af",
            "nome": "Afeganistão",
            "bandeira": "assets/bandeiras-paises/af.jpg",
            "opcoes": [
                "França",
                "Colômbia",
                "Sérvia",
                "Afeganistão"
            ]
        },
        {
            "id": 4,
            "sigla": "ag",
            "nome": "Antígua e Barbuda",
            "bandeira": "assets/bandeiras-paises/ag.jpg",
            "opcoes": [
                "Vietnã",
                "Austrália",
                "Coreia do Sul",
                "Antígua e Barbuda"
            ]
        },
        {
            "id": 5,
            "sigla": "ai",
            "nome": "Anguilla",
            "bandeira": "assets/bandeiras-paises/ai.jpg",
            "opcoes": [
                "Indonésia",
                "Portugal",
                "Peru",
                "Anguilla"
            ]
        },
        {
            "id": 6,
            "sigla": "al",
            "nome": "Albânia",
            "bandeira": "assets/bandeiras-paises/al.jpg",
            "opcoes": [
                "Arábia Saudita",
                "Alemanha",
                "Irlanda",
                "Albânia"
            ]
        },
        {
            "id": 7,
            "sigla": "am",
            "nome": "Armênia",
            "bandeira": "assets/bandeiras-paises/am.jpg",
            "opcoes": [
                "Armênia",
                "Austrália",
                "Índia",
                "Dinamarca"
            ]
        },
        {
            "id": 8,
            "sigla": "ao",
            "nome": "Angola",
            "bandeira": "assets/bandeiras-paises/ao.jpg",
            "opcoes": [
                "Angola",
                "Itália",
                "China",
                "México"
            ]
        },
        {
            "id": 9,
            "sigla": "aq",
            "nome": "Antártica",
            "bandeira": "assets/bandeiras-paises/aq.jpg",
            "opcoes": [
                "Portugal",
                "Rússia",
                "França",
                "Antártica"
            ]
        },
        {
            "id": 10,
            "sigla": "ar",
            "nome": "Argentina",
            "bandeira": "assets/bandeiras-paises/ar.jpg",
            "opcoes": [
                "Chile",
                "Argentina",
                "Alemanha",
                "Coreia do Sul"
            ]
        },
        {
            "id": 11,
            "sigla": "as",
            "nome": "Samoa Americana",
            "bandeira": "assets/bandeiras-paises/as.jpg",
            "opcoes": [
                "Áustria",
                "Tailândia",
                "Samoa Americana",
                "China"
            ]
        },
        {
            "id": 12,
            "sigla": "at",
            "nome": "Áustria",
            "bandeira": "assets/bandeiras-paises/at.jpg",
            "opcoes": [
                "Índia",
                "Argentina",
                "Áustria",
                "Austrália"
            ]
        },
        {
            "id": 13,
            "sigla": "au",
            "nome": "Austrália",
            "bandeira": "assets/bandeiras-paises/au.jpg",
            "opcoes": [
                "Vietnã",
                "Austrália",
                "Itália",
                "Indonésia"
            ]
        },
        {
            "id": 14,
            "sigla": "aw",
            "nome": "Aruba",
            "bandeira": "assets/bandeiras-paises/aw.jpg",
            "opcoes": [
                "Coreia do Sul",
                "Aruba",
                "Espanha",
                "Colômbia"
            ]
        },
        {
            "id": 15,
            "sigla": "ax",
            "nome": "Ilhas Aland",
            "bandeira": "assets/bandeiras-paises/ax.jpg",
            "opcoes": [
                "África do Sul",
                "Portugal",
                "Espanha",
                "Ilhas Aland"
            ]
        },
        {
            "id": 16,
            "sigla": "az",
            "nome": "Azerbaijão",
            "bandeira": "assets/bandeiras-paises/az.jpg",
            "opcoes": [
                "Portugal",
                "Filipinas",
                "Itália",
                "Azerbaijão"
            ]
        },
        {
            "id": 17,
            "sigla": "ba",
            "nome": "Bósnia e Herzegovina",
            "bandeira": "assets/bandeiras-paises/ba.jpg",
            "opcoes": [
                "Bósnia e Herzegovina",
                "Colômbia",
                "África do Sul",
                "Portugal"
            ]
        },
        {
            "id": 18,
            "sigla": "bb",
            "nome": "Barbados",
            "bandeira": "assets/bandeiras-paises/bb.jpg",
            "opcoes": [
                "Coreia do Sul",
                "Vietnã",
                "Austrália",
                "Barbados"
            ]
        },
        {
            "id": 19,
            "sigla": "bd",
            "nome": "Bangladesh",
            "bandeira": "assets/bandeiras-paises/bd.jpg",
            "opcoes": [
                "China",
                "Países Baixos",
                "Grécia",
                "Bangladesh"
            ]
        },
        {
            "id": 20,
            "sigla": "be",
            "nome": "Bélgica",
            "bandeira": "assets/bandeiras-paises/be.jpg",
            "opcoes": [
                "Itália",
                "Suíça",
                "Bélgica",
                "Noruega"
            ]
        },
        {
            "id": 21,
            "sigla": "bf",
            "nome": "Burkina Faso",
            "bandeira": "assets/bandeiras-paises/bf.jpg",
            "opcoes": [
                "Brasil",
                "Itália",
                "Burkina Faso",
                "Japão"
            ]
        },
        {
            "id": 22,
            "sigla": "bg",
            "nome": "Bulgária",
            "bandeira": "assets/bandeiras-paises/bg.jpg",
            "opcoes": [
                "Polônia",
                "Suécia",
                "Bulgária",
                "Arábia Saudita"
            ]
        },
        {
            "id": 23,
            "sigla": "bh",
            "nome": "Bahrein",
            "bandeira": "assets/bandeiras-paises/bh.jpg",
            "opcoes": [
                "Peru",
                "França",
                "Bahrein",
                "Coreia do Sul"
            ]
        },
        {
            "id": 24,
            "sigla": "bi",
            "nome": "Burundi",
            "bandeira": "assets/bandeiras-paises/bi.jpg",
            "opcoes": [
                "Turquia",
                "Suíça",
                "Portugal",
                "Burundi"
            ]
        },
        {
            "id": 25,
            "sigla": "bj",
            "nome": "Benin",
            "bandeira": "assets/bandeiras-paises/bj.jpg",
            "opcoes": [
                "Noruega",
                "Filipinas",
                "Egito",
                "Benin"
            ]
        },
        {
            "id": 26,
            "sigla": "bl",
            "nome": "São Bartolomeu",
            "bandeira": "assets/bandeiras-paises/bl.jpg",
            "opcoes": [
                "São Bartolomeu",
                "China",
                "Espanha",
                "Sérvia"
            ]
        },
        {
            "id": 27,
            "sigla": "bm",
            "nome": "Bermudas",
            "bandeira": "assets/bandeiras-paises/bm.jpg",
            "opcoes": [
                "Bermudas",
                "Peru",
                "Grécia",
                "China"
            ]
        },
        {
            "id": 28,
            "sigla": "bn",
            "nome": "Brunei",
            "bandeira": "assets/bandeiras-paises/bn.jpg",
            "opcoes": [
                "França",
                "México",
                "Brunei",
                "Grécia"
            ]
        },
        {
            "id": 29,
            "sigla": "bo",
            "nome": "Bolívia",
            "bandeira": "assets/bandeiras-paises/bo.jpg",
            "opcoes": [
                "Áustria",
                "Canadá",
                "Colômbia",
                "Bolívia"
            ]
        },
        {
            "id": 30,
            "sigla": "bq",
            "nome": "Bonaire, Santo Eustáquio e Saba",
            "bandeira": "assets/bandeiras-paises/bq.jpg",
            "opcoes": [
                "Espanha",
                "Bonaire, Santo Eustáquio e Saba",
                "Colômbia",
                "Países Baixos"
            ]
        },
        {
            "id": 31,
            "sigla": "br",
            "nome": "Brasil",
            "bandeira": "assets/bandeiras-paises/br.jpg",
            "opcoes": [
                "Brasil",
                "México",
                "Áustria",
                "Chile"
            ]
        },
        {
            "id": 32,
            "sigla": "bs",
            "nome": "Bahamas",
            "bandeira": "assets/bandeiras-paises/bs.jpg",
            "opcoes": [
                "Dinamarca",
                "Andorra",
                "Índia",
                "Bahamas"
            ]
        },
        {
            "id": 33,
            "sigla": "bt",
            "nome": "Butão",
            "bandeira": "assets/bandeiras-paises/bt.jpg",
            "opcoes": [
                "Japão",
                "Butão",
                "Colômbia",
                "Coreia do Sul"
            ]
        },
        {
            "id": 34,
            "sigla": "bv",
            "nome": "Ilha Bouvet",
            "bandeira": "assets/bandeiras-paises/bv.jpg",
            "opcoes": [
                "Finlândia",
                "Países Baixos",
                "Andorra",
                "Ilha Bouvet"
            ]
        },
        {
            "id": 35,
            "sigla": "bw",
            "nome": "Botswana",
            "bandeira": "assets/bandeiras-paises/bw.jpg",
            "opcoes": [
                "Brasil",
                "Botswana",
                "Áustria",
                "Alemanha"
            ]
        },
        {
            "id": 36,
            "sigla": "by",
            "nome": "Bielorrússia",
            "bandeira": "assets/bandeiras-paises/by.jpg",
            "opcoes": [
                "Bielorrússia",
                "Portugal",
                "Espanha",
                "Coreia do Sul"
            ]
        },
        {
            "id": 37,
            "sigla": "bz",
            "nome": "Belize",
            "bandeira": "assets/bandeiras-paises/bz.jpg",
            "opcoes": [
                "Filipinas",
                "Bélgica",
                "Brasil",
                "Belize"
            ]
        },
        {
            "id": 38,
            "sigla": "ca",
            "nome": "Canadá",
            "bandeira": "assets/bandeiras-paises/ca.jpg",
            "opcoes": [
                "Portugal",
                "Canadá",
                "Polônia",
                "Arábia Saudita"
            ]
        },
        {
            "id": 39,
            "sigla": "cc",
            "nome": "Ilhas Cocos (Keeling)",
            "bandeira": "assets/bandeiras-paises/cc.jpg",
            "opcoes": [
                "China",
                "Bélgica",
                "Rússia",
                "Ilhas Cocos (Keeling)"
            ]
        },
        {
            "id": 40,
            "sigla": "cd",
            "nome": "Congo (RDC)",
            "bandeira": "assets/bandeiras-paises/cd.jpg",
            "opcoes": [
                "Congo (RDC)",
                "Dinamarca",
                "França",
                "Japão"
            ]
        },
        {
            "id": 41,
            "sigla": "cf",
            "nome": "República Centro-Africana",
            "bandeira": "assets/bandeiras-paises/cf.jpg",
            "opcoes": [
                "República Centro-Africana",
                "Canadá",
                "Argentina",
                "Coreia do Sul"
            ]
        },
        {
            "id": 42,
            "sigla": "cg",
            "nome": "Congo",
            "bandeira": "assets/bandeiras-paises/cg.jpg",
            "opcoes": [
                "Sérvia",
                "Nova Zelândia",
                "Congo",
                "Filipinas"
            ]
        },
        {
            "id": 43,
            "sigla": "ch",
            "nome": "Suíça",
            "bandeira": "assets/bandeiras-paises/ch.jpg",
            "opcoes": [
                "Bélgica",
                "Suíça",
                "Brasil",
                "Nova Zelândia"
            ]
        },
        {
            "id": 44,
            "sigla": "ci",
            "nome": "Costa do Marfim",
            "bandeira": "assets/bandeiras-paises/ci.jpg",
            "opcoes": [
                "Andorra",
                "Costa do Marfim",
                "Chile",
                "Dinamarca"
            ]
        },
        {
            "id": 45,
            "sigla": "ck",
            "nome": "Ilhas Cook",
            "bandeira": "assets/bandeiras-paises/ck.jpg",
            "opcoes": [
                "Japão",
                "Nova Zelândia",
                "Egito",
                "Ilhas Cook"
            ]
        },
        {
            "id": 46,
            "sigla": "cl",
            "nome": "Chile",
            "bandeira": "assets/bandeiras-paises/cl.jpg",
            "opcoes": [
                "Chile",
                "Tailândia",
                "Nova Zelândia",
                "Alemanha"
            ]
        },
        {
            "id": 47,
            "sigla": "cm",
            "nome": "Camarões",
            "bandeira": "assets/bandeiras-paises/cm.jpg",
            "opcoes": [
                "Grécia",
                "Camarões",
                "Portugal",
                "Turquia"
            ]
        },
        {
            "id": 48,
            "sigla": "cn",
            "nome": "China",
            "bandeira": "assets/bandeiras-paises/cn.jpg",
            "opcoes": [
                "Espanha",
                "China",
                "Índia",
                "Colômbia"
            ]
        },
        {
            "id": 49,
            "sigla": "co",
            "nome": "Colômbia",
            "bandeira": "assets/bandeiras-paises/co.jpg",
            "opcoes": [
                "Rússia",
                "Colômbia",
                "Malásia",
                "Espanha"
            ]
        },
        {
            "id": 50,
            "sigla": "cr",
            "nome": "Costa Rica",
            "bandeira": "assets/bandeiras-paises/cr.jpg",
            "opcoes": [
                "Costa Rica",
                "Chile",
                "Indonésia",
                "Índia"
            ]
        },
        {
            "id": 51,
            "sigla": "cu",
            "nome": "Cuba",
            "bandeira": "assets/bandeiras-paises/cu.jpg",
            "opcoes": [
                "Alemanha",
                "Tailândia",
                "Polônia",
                "Cuba"
            ]
        },
        {
            "id": 52,
            "sigla": "cv",
            "nome": "Cabo Verde",
            "bandeira": "assets/bandeiras-paises/cv.jpg",
            "opcoes": [
                "China",
                "Arábia Saudita",
                "Cabo Verde",
                "França"
            ]
        },
        {
            "id": 53,
            "sigla": "cw",
            "nome": "Curaçao",
            "bandeira": "assets/bandeiras-paises/cw.jpg",
            "opcoes": [
                "Curaçao",
                "Itália",
                "Espanha",
                "Arábia Saudita"
            ]
        },
        {
            "id": 54,
            "sigla": "cx",
            "nome": "Ilhas Christmas",
            "bandeira": "assets/bandeiras-paises/cx.jpg",
            "opcoes": [
                "Suécia",
                "Nova Zelândia",
                "Ilhas Christmas",
                "Canadá"
            ]
        },
        {
            "id": 55,
            "sigla": "cy",
            "nome": "Chipre",
            "bandeira": "assets/bandeiras-paises/cy.jpg",
            "opcoes": [
                "China",
                "Colômbia",
                "Suécia",
                "Chipre"
            ]
        },
        {
            "id": 56,
            "sigla": "cz",
            "nome": "República Checa",
            "bandeira": "assets/bandeiras-paises/cz.jpg",
            "opcoes": [
                "República Checa",
                "México",
                "Dinamarca",
                "Itália"
            ]
        },
        {
            "id": 57,
            "sigla": "de",
            "nome": "Alemanha",
            "bandeira": "assets/bandeiras-paises/de.jpg",
            "opcoes": [
                "Índia",
                "Alemanha",
                "Chile",
                "Austrália"
            ]
        },
        {
            "id": 58,
            "sigla": "dj",
            "nome": "Djibouti",
            "bandeira": "assets/bandeiras-paises/dj.jpg",
            "opcoes": [
                "Nova Zelândia",
                "Djibouti",
                "África do Sul",
                "Suécia"
            ]
        },
        {
            "id": 59,
            "sigla": "dk",
            "nome": "Dinamarca",
            "bandeira": "assets/bandeiras-paises/dk.jpg",
            "opcoes": [
                "Dinamarca",
                "Vietnã",
                "China",
                "Áustria"
            ]
        },
        {
            "id": 60,
            "sigla": "dm",
            "nome": "Dominica",
            "bandeira": "assets/bandeiras-paises/dm.jpg",
            "opcoes": [
                "Dominica",
                "Rússia",
                "Japão",
                "Turquia"
            ]
        },
        {
            "id": 61,
            "sigla": "do",
            "nome": "República Dominicana",
            "bandeira": "assets/bandeiras-paises/do.jpg",
            "opcoes": [
                "Vietnã",
                "Alemanha",
                "República Dominicana",
                "África do Sul"
            ]
        },
        {
            "id": 62,
            "sigla": "dz",
            "nome": "Argélia",
            "bandeira": "assets/bandeiras-paises/dz.jpg",
            "opcoes": [
                "Brasil",
                "Canadá",
                "Bélgica",
                "Argélia"
            ]
        },
        {
            "id": 63,
            "sigla": "ec",
            "nome": "Equador",
            "bandeira": "assets/bandeiras-paises/ec.jpg",
            "opcoes": [
                "Bélgica",
                "Equador",
                "Rússia",
                "México"
            ]
        },
        {
            "id": 64,
            "sigla": "ee",
            "nome": "Estônia",
            "bandeira": "assets/bandeiras-paises/ee.jpg",
            "opcoes": [
                "Grécia",
                "Países Baixos",
                "Estônia",
                "Malásia"
            ]
        },
        {
            "id": 65,
            "sigla": "eg",
            "nome": "Egito",
            "bandeira": "assets/bandeiras-paises/eg.jpg",
            "opcoes": [
                "Egito",
                "Austrália",
                "Filipinas",
                "Áustria"
            ]
        },
        {
            "id": 66,
            "sigla": "eh",
            "nome": "Saara Ocidental",
            "bandeira": "assets/bandeiras-paises/eh.jpg",
            "opcoes": [
                "Tailândia",
                "Argentina",
                "Irlanda",
                "Saara Ocidental"
            ]
        },
        {
            "id": 67,
            "sigla": "er",
            "nome": "Eritreia",
            "bandeira": "assets/bandeiras-paises/er.jpg",
            "opcoes": [
                "Colômbia",
                "Eritreia",
                "Itália",
                "Filipinas"
            ]
        },
        {
            "id": 68,
            "sigla": "es",
            "nome": "Espanha",
            "bandeira": "assets/bandeiras-paises/es.jpg",
            "opcoes": [
                "Países Baixos",
                "México",
                "Espanha",
                "China"
            ]
        },
        {
            "id": 69,
            "sigla": "et",
            "nome": "Etiópia",
            "bandeira": "assets/bandeiras-paises/et.jpg",
            "opcoes": [
                "Coreia do Sul",
                "França",
                "Etiópia",
                "Indonésia"
            ]
        },
        {
            "id": 70,
            "sigla": "fi",
            "nome": "Finlândia",
            "bandeira": "assets/bandeiras-paises/fi.jpg",
            "opcoes": [
                "Finlândia",
                "Argentina",
                "Andorra",
                "Irlanda"
            ]
        },
        {
            "id": 71,
            "sigla": "fj",
            "nome": "Fiji",
            "bandeira": "assets/bandeiras-paises/fj.jpg",
            "opcoes": [
                "Filipinas",
                "Países Baixos",
                "Tailândia",
                "Fiji"
            ]
        },
        {
            "id": 72,
            "sigla": "fk",
            "nome": "Ilhas Malvinas",
            "bandeira": "assets/bandeiras-paises/fk.jpg",
            "opcoes": [
                "China",
                "Ilhas Malvinas",
                "Arábia Saudita",
                "Suécia"
            ]
        },
        {
            "id": 73,
            "sigla": "fm",
            "nome": "Micronésia",
            "bandeira": "assets/bandeiras-paises/fm.jpg",
            "opcoes": [
                "Turquia",
                "Coreia do Sul",
                "Micronésia",
                "Sérvia"
            ]
        },
        {
            "id": 74,
            "sigla": "fo",
            "nome": "Ilhas Faroe",
            "bandeira": "assets/bandeiras-paises/fo.jpg",
            "opcoes": [
                "Ilhas Faroe",
                "Turquia",
                "Brasil",
                "Andorra"
            ]
        },
        {
            "id": 75,
            "sigla": "fr",
            "nome": "França",
            "bandeira": "assets/bandeiras-paises/fr.jpg",
            "opcoes": [
                "Portugal",
                "França",
                "Coreia do Sul",
                "Egito"
            ]
        },
        {
            "id": 76,
            "sigla": "ga",
            "nome": "Gabão",
            "bandeira": "assets/bandeiras-paises/ga.jpg",
            "opcoes": [
                "China",
                "Vietnã",
                "Dinamarca",
                "Gabão"
            ]
        },
        {
            "id": 77,
            "sigla": "gb-eng",
            "nome": "Inglaterra",
            "bandeira": "assets/bandeiras-paises/gb-eng.jpg",
            "opcoes": [
                "Colômbia",
                "Sérvia",
                "Inglaterra",
                "Polônia"
            ]
        },
        {
            "id": 78,
            "sigla": "gb-nir",
            "nome": "Irlanda do Norte",
            "bandeira": "assets/bandeiras-paises/gb-nir.jpg",
            "opcoes": [
                "Indonésia",
                "Colômbia",
                "África do Sul",
                "Irlanda do Norte"
            ]
        },
        {
            "id": 79,
            "sigla": "gb-sct",
            "nome": "Escócia",
            "bandeira": "assets/bandeiras-paises/gb-sct.jpg",
            "opcoes": [
                "França",
                "Argentina",
                "Austrália",
                "Escócia"
            ]
        },
        {
            "id": 80,
            "sigla": "gb-wls",
            "nome": "País de Gales",
            "bandeira": "assets/bandeiras-paises/gb-wls.jpg",
            "opcoes": [
                "China",
                "Grécia",
                "Egito",
                "País de Gales"
            ]
        },
        {
            "id": 81,
            "sigla": "gb",
            "nome": "Reino Unido",
            "bandeira": "assets/bandeiras-paises/gb.jpg",
            "opcoes": [
                "Filipinas",
                "Portugal",
                "Reino Unido",
                "Andorra"
            ]
        },
        {
            "id": 82,
            "sigla": "gd",
            "nome": "Granada",
            "bandeira": "assets/bandeiras-paises/gd.jpg",
            "opcoes": [
                "França",
                "Alemanha",
                "Granada",
                "Suécia"
            ]
        },
        {
            "id": 83,
            "sigla": "ge",
            "nome": "Geórgia",
            "bandeira": "assets/bandeiras-paises/ge.jpg",
            "opcoes": [
                "Noruega",
                "Tailândia",
                "Geórgia",
                "África do Sul"
            ]
        },
        {
            "id": 84,
            "sigla": "gf",
            "nome": "Guiana Francesa",
            "bandeira": "assets/bandeiras-paises/gf.jpg",
            "opcoes": [
                "Bélgica",
                "Guiana Francesa",
                "Filipinas",
                "Dinamarca"
            ]
        },
        {
            "id": 85,
            "sigla": "gg",
            "nome": "Guernsey",
            "bandeira": "assets/bandeiras-paises/gg.jpg",
            "opcoes": [
                "México",
                "Guernsey",
                "Áustria",
                "Malásia"
            ]
        },
        {
            "id": 86,
            "sigla": "gh",
            "nome": "Gana",
            "bandeira": "assets/bandeiras-paises/gh.jpg",
            "opcoes": [
                "Rússia",
                "Noruega",
                "Japão",
                "Gana"
            ]
        },
        {
            "id": 87,
            "sigla": "gi",
            "nome": "Gibraltar",
            "bandeira": "assets/bandeiras-paises/gi.jpg",
            "opcoes": [
                "Gibraltar",
                "Países Baixos",
                "Bélgica",
                "Suíça"
            ]
        },
        {
            "id": 88,
            "sigla": "gl",
            "nome": "Groenlândia",
            "bandeira": "assets/bandeiras-paises/gl.jpg",
            "opcoes": [
                "Rússia",
                "Turquia",
                "Groenlândia",
                "Austrália"
            ]
        },
        {
            "id": 89,
            "sigla": "gm",
            "nome": "Gâmbia",
            "bandeira": "assets/bandeiras-paises/gm.jpg",
            "opcoes": [
                "Indonésia",
                "Gâmbia",
                "Brasil",
                "Espanha"
            ]
        },
        {
            "id": 90,
            "sigla": "gn",
            "nome": "Guiné",
            "bandeira": "assets/bandeiras-paises/gn.jpg",
            "opcoes": [
                "Guiné",
                "Brasil",
                "Arábia Saudita",
                "Suíça"
            ]
        },
        {
            "id": 91,
            "sigla": "gp",
            "nome": "Guadalupe",
            "bandeira": "assets/bandeiras-paises/gp.jpg",
            "opcoes": [
                "Áustria",
                "Turquia",
                "Guadalupe",
                "França"
            ]
        },
        {
            "id": 92,
            "sigla": "gq",
            "nome": "Guiné Equatorial",
            "bandeira": "assets/bandeiras-paises/gq.jpg",
            "opcoes": [
                "Coreia do Sul",
                "Suécia",
                "Itália",
                "Guiné Equatorial"
            ]
        },
        {
            "id": 93,
            "sigla": "gr",
            "nome": "Grécia",
            "bandeira": "assets/bandeiras-paises/gr.jpg",
            "opcoes": [
                "Brasil",
                "Sérvia",
                "Grécia",
                "Canadá"
            ]
        },
        {
            "id": 94,
            "sigla": "gs",
            "nome": "Ilhas Geórgia do Sul e Sandwich do Sul",
            "bandeira": "assets/bandeiras-paises/gs.jpg",
            "opcoes": [
                "China",
                "Ilhas Geórgia do Sul e Sandwich do Sul",
                "Egito",
                "Finlândia"
            ]
        },
        {
            "id": 95,
            "sigla": "gt",
            "nome": "Guatemala",
            "bandeira": "assets/bandeiras-paises/gt.jpg",
            "opcoes": [
                "Espanha",
                "Sérvia",
                "Guatemala",
                "Colômbia"
            ]
        },
        {
            "id": 96,
            "sigla": "gu",
            "nome": "Guam",
            "bandeira": "assets/bandeiras-paises/gu.jpg",
            "opcoes": [
                "África do Sul",
                "Brasil",
                "Guam",
                "Coreia do Sul"
            ]
        },
        {
            "id": 97,
            "sigla": "gw",
            "nome": "Guiné-Bissau",
            "bandeira": "assets/bandeiras-paises/gw.jpg",
            "opcoes": [
                "Alemanha",
                "Guiné-Bissau",
                "Rússia",
                "Filipinas"
            ]
        },
        {
            "id": 98,
            "sigla": "gy",
            "nome": "Guiana",
            "bandeira": "assets/bandeiras-paises/gy.jpg",
            "opcoes": [
                "Tailândia",
                "Argentina",
                "Guiana",
                "Brasil"
            ]
        },
        {
            "id": 99,
            "sigla": "hk",
            "nome": "Hong Kong",
            "bandeira": "assets/bandeiras-paises/hk.jpg",
            "opcoes": [
                "Hong Kong",
                "Espanha",
                "Japão",
                "Suécia"
            ]
        },
        {
            "id": 100,
            "sigla": "hm",
            "nome": "Ilhas Heard e McDonald",
            "bandeira": "assets/bandeiras-paises/hm.jpg",
            "opcoes": [
                "Polônia",
                "Suíça",
                "Dinamarca",
                "Ilhas Heard e McDonald"
            ]
        },
        {
            "id": 101,
            "sigla": "hn",
            "nome": "Honduras",
            "bandeira": "assets/bandeiras-paises/hn.jpg",
            "opcoes": [
                "Dinamarca",
                "Honduras",
                "Nova Zelândia",
                "Vietnã"
            ]
        },
        {
            "id": 102,
            "sigla": "hr",
            "nome": "Croácia",
            "bandeira": "assets/bandeiras-paises/hr.jpg",
            "opcoes": [
                "Indonésia",
                "Irlanda",
                "Croácia",
                "África do Sul"
            ]
        },
        {
            "id": 103,
            "sigla": "ht",
            "nome": "Haiti",
            "bandeira": "assets/bandeiras-paises/ht.jpg",
            "opcoes": [
                "Índia",
                "Andorra",
                "Haiti",
                "Tailândia"
            ]
        },
        {
            "id": 104,
            "sigla": "hu",
            "nome": "Hungria",
            "bandeira": "assets/bandeiras-paises/hu.jpg",
            "opcoes": [
                "Andorra",
                "Hungria",
                "Arábia Saudita",
                "China"
            ]
        },
        {
            "id": 105,
            "sigla": "id",
            "nome": "Indonésia",
            "bandeira": "assets/bandeiras-paises/id.jpg",
            "opcoes": [
                "Canadá",
                "Tailândia",
                "Peru",
                "Indonésia"
            ]
        },
        {
            "id": 106,
            "sigla": "ie",
            "nome": "Irlanda",
            "bandeira": "assets/bandeiras-paises/ie.jpg",
            "opcoes": [
                "Andorra",
                "Irlanda",
                "França",
                "Argentina"
            ]
        },
        {
            "id": 107,
            "sigla": "il",
            "nome": "Israel",
            "bandeira": "assets/bandeiras-paises/il.jpg",
            "opcoes": [
                "Noruega",
                "Israel",
                "Andorra",
                "China"
            ]
        },
        {
            "id": 108,
            "sigla": "im",
            "nome": "Ilha de Man",
            "bandeira": "assets/bandeiras-paises/im.jpg",
            "opcoes": [
                "Alemanha",
                "Ilha de Man",
                "Brasil",
                "China"
            ]
        },
        {
            "id": 109,
            "sigla": "in",
            "nome": "Índia",
            "bandeira": "assets/bandeiras-paises/in.jpg",
            "opcoes": [
                "México",
                "Indonésia",
                "Índia",
                "Filipinas"
            ]
        },
        {
            "id": 110,
            "sigla": "io",
            "nome": "Território Britânico do Oceano Índico",
            "bandeira": "assets/bandeiras-paises/io.jpg",
            "opcoes": [
                "Índia",
                "Território Britânico do Oceano Índico",
                "Finlândia",
                "Rússia"
            ]
        },
        {
            "id": 111,
            "sigla": "iq",
            "nome": "Iraque",
            "bandeira": "assets/bandeiras-paises/iq.jpg",
            "opcoes": [
                "África do Sul",
                "Argentina",
                "Iraque",
                "Bélgica"
            ]
        },
        {
            "id": 112,
            "sigla": "ir",
            "nome": "Irã",
            "bandeira": "assets/bandeiras-paises/ir.jpg",
            "opcoes": [
                "Indonésia",
                "Sérvia",
                "Andorra",
                "Irã"
            ]
        },
        {
            "id": 113,
            "sigla": "is",
            "nome": "Islândia",
            "bandeira": "assets/bandeiras-paises/is.jpg",
            "opcoes": [
                "Indonésia",
                "Islândia",
                "Suécia",
                "Austrália"
            ]
        },
        {
            "id": 114,
            "sigla": "it",
            "nome": "Itália",
            "bandeira": "assets/bandeiras-paises/it.jpg",
            "opcoes": [
                "Dinamarca",
                "Colômbia",
                "Suécia",
                "Itália"
            ]
        },
        {
            "id": 115,
            "sigla": "je",
            "nome": "Jersey",
            "bandeira": "assets/bandeiras-paises/je.jpg",
            "opcoes": [
                "Países Baixos",
                "Coreia do Sul",
                "Malásia",
                "Jersey"
            ]
        },
        {
            "id": 116,
            "sigla": "jm",
            "nome": "Jamaica",
            "bandeira": "assets/bandeiras-paises/jm.jpg",
            "opcoes": [
                "Vietnã",
                "China",
                "Malásia",
                "Jamaica"
            ]
        },
        {
            "id": 117,
            "sigla": "jo",
            "nome": "Jordânia",
            "bandeira": "assets/bandeiras-paises/jo.jpg",
            "opcoes": [
                "Tailândia",
                "Jordânia",
                "Arábia Saudita",
                "Argentina"
            ]
        },
        {
            "id": 118,
            "sigla": "jp",
            "nome": "Japão",
            "bandeira": "assets/bandeiras-paises/jp.jpg",
            "opcoes": [
                "Japão",
                "Coreia do Sul",
                "Chile",
                "Polônia"
            ]
        },
        {
            "id": 119,
            "sigla": "ke",
            "nome": "Quênia",
            "bandeira": "assets/bandeiras-paises/ke.jpg",
            "opcoes": [
                "Grécia",
                "Quênia",
                "Vietnã",
                "Indonésia"
            ]
        },
        {
            "id": 120,
            "sigla": "kg",
            "nome": "Quirguistão",
            "bandeira": "assets/bandeiras-paises/kg.jpg",
            "opcoes": [
                "Japão",
                "Países Baixos",
                "Quirguistão",
                "Canadá"
            ]
        },
        {
            "id": 121,
            "sigla": "kh",
            "nome": "Camboja",
            "bandeira": "assets/bandeiras-paises/kh.jpg",
            "opcoes": [
                "Espanha",
                "México",
                "Irlanda",
                "Camboja"
            ]
        },
        {
            "id": 122,
            "sigla": "ki",
            "nome": "Kiribati",
            "bandeira": "assets/bandeiras-paises/ki.jpg",
            "opcoes": [
                "Kiribati",
                "Bélgica",
                "África do Sul",
                "Japão"
            ]
        },
        {
            "id": 123,
            "sigla": "km",
            "nome": "Comores",
            "bandeira": "assets/bandeiras-paises/km.jpg",
            "opcoes": [
                "Comores",
                "Dinamarca",
                "Andorra",
                "Grécia"
            ]
        },
        {
            "id": 124,
            "sigla": "kn",
            "nome": "São Cristóvão e Nevis",
            "bandeira": "assets/bandeiras-paises/kn.jpg",
            "opcoes": [
                "Países Baixos",
                "Áustria",
                "São Cristóvão e Nevis",
                "Portugal"
            ]
        },
        {
            "id": 125,
            "sigla": "kp",
            "nome": "Coreia do Norte",
            "bandeira": "assets/bandeiras-paises/kp.jpg",
            "opcoes": [
                "Suíça",
                "Coreia do Norte",
                "Sérvia",
                "Nova Zelândia"
            ]
        },
        {
            "id": 126,
            "sigla": "kr",
            "nome": "Coreia do Sul",
            "bandeira": "assets/bandeiras-paises/kr.jpg",
            "opcoes": [
                "Portugal",
                "Espanha",
                "Arábia Saudita",
                "Coreia do Sul"
            ]
        },
        {
            "id": 127,
            "sigla": "kw",
            "nome": "Kuwait",
            "bandeira": "assets/bandeiras-paises/kw.jpg",
            "opcoes": [
                "Vietnã",
                "Malásia",
                "Kuwait",
                "Bélgica"
            ]
        },
        {
            "id": 128,
            "sigla": "ky",
            "nome": "Ilhas Caimã",
            "bandeira": "assets/bandeiras-paises/ky.jpg",
            "opcoes": [
                "Filipinas",
                "Canadá",
                "Coreia do Sul",
                "Ilhas Caimã"
            ]
        },
        {
            "id": 129,
            "sigla": "kz",
            "nome": "Cazaquistão",
            "bandeira": "assets/bandeiras-paises/kz.jpg",
            "opcoes": [
                "Sérvia",
                "Cazaquistão",
                "Itália",
                "Polônia"
            ]
        },
        {
            "id": 130,
            "sigla": "la",
            "nome": "Laos",
            "bandeira": "assets/bandeiras-paises/la.jpg",
            "opcoes": [
                "Andorra",
                "Laos",
                "Arábia Saudita",
                "Filipinas"
            ]
        },
        {
            "id": 131,
            "sigla": "lb",
            "nome": "Líbano",
            "bandeira": "assets/bandeiras-paises/lb.jpg",
            "opcoes": [
                "Países Baixos",
                "Índia",
                "Líbano",
                "Alemanha"
            ]
        },
        {
            "id": 132,
            "sigla": "lc",
            "nome": "Santa Lúcia",
            "bandeira": "assets/bandeiras-paises/lc.jpg",
            "opcoes": [
                "Alemanha",
                "Santa Lúcia",
                "Austrália",
                "Nova Zelândia"
            ]
        },
        {
            "id": 133,
            "sigla": "li",
            "nome": "Liechtenstein",
            "bandeira": "assets/bandeiras-paises/li.jpg",
            "opcoes": [
                "Brasil",
                "França",
                "Noruega",
                "Liechtenstein"
            ]
        },
        {
            "id": 134,
            "sigla": "lk",
            "nome": "Sri Lanka",
            "bandeira": "assets/bandeiras-paises/lk.jpg",
            "opcoes": [
                "Itália",
                "Sri Lanka",
                "Argentina",
                "México"
            ]
        },
        {
            "id": 135,
            "sigla": "lr",
            "nome": "Libéria",
            "bandeira": "assets/bandeiras-paises/lr.jpg",
            "opcoes": [
                "Turquia",
                "Libéria",
                "Filipinas",
                "China"
            ]
        },
        {
            "id": 136,
            "sigla": "ls",
            "nome": "Lesoto",
            "bandeira": "assets/bandeiras-paises/ls.jpg",
            "opcoes": [
                "Espanha",
                "Andorra",
                "Lesoto",
                "Portugal"
            ]
        },
        {
            "id": 137,
            "sigla": "lt",
            "nome": "Lituânia",
            "bandeira": "assets/bandeiras-paises/lt.jpg",
            "opcoes": [
                "Lituânia",
                "Arábia Saudita",
                "Áustria",
                "Malásia"
            ]
        },
        {
            "id": 138,
            "sigla": "lu",
            "nome": "Luxemburgo",
            "bandeira": "assets/bandeiras-paises/lu.jpg",
            "opcoes": [
                "Suíça",
                "Espanha",
                "Indonésia",
                "Luxemburgo"
            ]
        },
        {
            "id": 139,
            "sigla": "lv",
            "nome": "Letônia",
            "bandeira": "assets/bandeiras-paises/lv.jpg",
            "opcoes": [
                "Egito",
                "Letônia",
                "Sérvia",
                "Vietnã"
            ]
        },
        {
            "id": 140,
            "sigla": "ly",
            "nome": "Líbia",
            "bandeira": "assets/bandeiras-paises/ly.jpg",
            "opcoes": [
                "Coreia do Sul",
                "Alemanha",
                "Líbia",
                "Brasil"
            ]
        },
        {
            "id": 141,
            "sigla": "ma",
            "nome": "Marrocos",
            "bandeira": "assets/bandeiras-paises/ma.jpg",
            "opcoes": [
                "Malásia",
                "Colômbia",
                "Marrocos",
                "Bélgica"
            ]
        },
        {
            "id": 142,
            "sigla": "mc",
            "nome": "Mônaco",
            "bandeira": "assets/bandeiras-paises/mc.jpg",
            "opcoes": [
                "Mônaco",
                "Grécia",
                "Brasil",
                "Polônia"
            ]
        },
        {
            "id": 143,
            "sigla": "md",
            "nome": "Moldávia",
            "bandeira": "assets/bandeiras-paises/md.jpg",
            "opcoes": [
                "Dinamarca",
                "Moldávia",
                "Andorra",
                "Áustria"
            ]
        },
        {
            "id": 144,
            "sigla": "me",
            "nome": "Montenegro",
            "bandeira": "assets/bandeiras-paises/me.jpg",
            "opcoes": [
                "Países Baixos",
                "China",
                "Índia",
                "Montenegro"
            ]
        },
        {
            "id": 145,
            "sigla": "mf",
            "nome": "São Martinho",
            "bandeira": "assets/bandeiras-paises/mf.jpg",
            "opcoes": [
                "Alemanha",
                "Bélgica",
                "Brasil",
                "São Martinho"
            ]
        },
        {
            "id": 146,
            "sigla": "mg",
            "nome": "Madagascar",
            "bandeira": "assets/bandeiras-paises/mg.jpg",
            "opcoes": [
                "México",
                "Peru",
                "Sérvia",
                "Madagascar"
            ]
        },
        {
            "id": 147,
            "sigla": "mh",
            "nome": "Ilhas Marshall",
            "bandeira": "assets/bandeiras-paises/mh.jpg",
            "opcoes": [
                "Arábia Saudita",
                "Ilhas Marshall",
                "Egito",
                "Vietnã"
            ]
        },
        {
            "id": 148,
            "sigla": "mk",
            "nome": "Macedônia do Norte",
            "bandeira": "assets/bandeiras-paises/mk.jpg",
            "opcoes": [
                "Bélgica",
                "Colômbia",
                "China",
                "Macedônia do Norte"
            ]
        },
        {
            "id": 149,
            "sigla": "ml",
            "nome": "Mali",
            "bandeira": "assets/bandeiras-paises/ml.jpg",
            "opcoes": [
                "Mali",
                "Andorra",
                "Índia",
                "Filipinas"
            ]
        },
        {
            "id": 150,
            "sigla": "mm",
            "nome": "Mianmar",
            "bandeira": "assets/bandeiras-paises/mm.jpg",
            "opcoes": [
                "Colômbia",
                "Mianmar",
                "México",
                "Coreia do Sul"
            ]
        },
        {
            "id": 151,
            "sigla": "mn",
            "nome": "Mongólia",
            "bandeira": "assets/bandeiras-paises/mn.jpg",
            "opcoes": [
                "Filipinas",
                "Mongólia",
                "Portugal",
                "Arábia Saudita"
            ]
        },
        {
            "id": 152,
            "sigla": "mo",
            "nome": "Macau",
            "bandeira": "assets/bandeiras-paises/mo.jpg",
            "opcoes": [
                "Chile",
                "Grécia",
                "Turquia",
                "Macau"
            ]
        },
        {
            "id": 153,
            "sigla": "mp",
            "nome": "Ilhas Marianas do Norte",
            "bandeira": "assets/bandeiras-paises/mp.jpg",
            "opcoes": [
                "Turquia",
                "Vietnã",
                "Ilhas Marianas do Norte",
                "Chile"
            ]
        },
        {
            "id": 154,
            "sigla": "mq",
            "nome": "Martinica",
            "bandeira": "assets/bandeiras-paises/mq.jpg",
            "opcoes": [
                "Polônia",
                "México",
                "Martinica",
                "Egito"
            ]
        },
        {
            "id": 155,
            "sigla": "mr",
            "nome": "Mauritânia",
            "bandeira": "assets/bandeiras-paises/mr.jpg",
            "opcoes": [
                "Irlanda",
                "Alemanha",
                "China",
                "Mauritânia"
            ]
        },
        {
            "id": 156,
            "sigla": "ms",
            "nome": "Montserrat",
            "bandeira": "assets/bandeiras-paises/ms.jpg",
            "opcoes": [
                "Argentina",
                "Finlândia",
                "Espanha",
                "Montserrat"
            ]
        },
        {
            "id": 157,
            "sigla": "mt",
            "nome": "Malta",
            "bandeira": "assets/bandeiras-paises/mt.jpg",
            "opcoes": [
                "Tailândia",
                "Peru",
                "Grécia",
                "Malta"
            ]
        },
        {
            "id": 158,
            "sigla": "mu",
            "nome": "Maurício",
            "bandeira": "assets/bandeiras-paises/mu.jpg",
            "opcoes": [
                "Índia",
                "Noruega",
                "Finlândia",
                "Maurício"
            ]
        },
        {
            "id": 159,
            "sigla": "mv",
            "nome": "Maldivas",
            "bandeira": "assets/bandeiras-paises/mv.jpg",
            "opcoes": [
                "Maldivas",
                "México",
                "Áustria",
                "Turquia"
            ]
        },
        {
            "id": 160,
            "sigla": "mw",
            "nome": "Malawi",
            "bandeira": "assets/bandeiras-paises/mw.jpg",
            "opcoes": [
                "Itália",
                "Tailândia",
                "Malawi",
                "Rússia"
            ]
        },
        {
            "id": 161,
            "sigla": "mx",
            "nome": "México",
            "bandeira": "assets/bandeiras-paises/mx.jpg",
            "opcoes": [
                "Canadá",
                "Suíça",
                "México",
                "Nova Zelândia"
            ]
        },
        {
            "id": 162,
            "sigla": "my",
            "nome": "Malásia",
            "bandeira": "assets/bandeiras-paises/my.jpg",
            "opcoes": [
                "Alemanha",
                "Canadá",
                "Suíça",
                "Malásia"
            ]
        },
        {
            "id": 163,
            "sigla": "mz",
            "nome": "Moçambique",
            "bandeira": "assets/bandeiras-paises/mz.jpg",
            "opcoes": [
                "Arábia Saudita",
                "Polônia",
                "Vietnã",
                "Moçambique"
            ]
        },
        {
            "id": 164,
            "sigla": "na",
            "nome": "Namíbia",
            "bandeira": "assets/bandeiras-paises/na.jpg",
            "opcoes": [
                "Argentina",
                "França",
                "Namíbia",
                "Polônia"
            ]
        },
        {
            "id": 165,
            "sigla": "nc",
            "nome": "Nova Caledônia",
            "bandeira": "assets/bandeiras-paises/nc.jpg",
            "opcoes": [
                "Peru",
                "Grécia",
                "Bélgica",
                "Nova Caledônia"
            ]
        },
        {
            "id": 166,
            "sigla": "ne",
            "nome": "Níger",
            "bandeira": "assets/bandeiras-paises/ne.jpg",
            "opcoes": [
                "Nova Zelândia",
                "Níger",
                "Índia",
                "Colômbia"
            ]
        },
        {
            "id": 167,
            "sigla": "nf",
            "nome": "Ilha Norfolk",
            "bandeira": "assets/bandeiras-paises/nf.jpg",
            "opcoes": [
                "Japão",
                "Ilha Norfolk",
                "Brasil",
                "Colômbia"
            ]
        },
        {
            "id": 168,
            "sigla": "ng",
            "nome": "Nigéria",
            "bandeira": "assets/bandeiras-paises/ng.jpg",
            "opcoes": [
                "Nigéria",
                "Suíça",
                "Chile",
                "Colômbia"
            ]
        },
        {
            "id": 169,
            "sigla": "ni",
            "nome": "Nicarágua",
            "bandeira": "assets/bandeiras-paises/ni.jpg",
            "opcoes": [
                "Peru",
                "Chile",
                "Nicarágua",
                "México"
            ]
        },
        {
            "id": 170,
            "sigla": "nl",
            "nome": "Holanda",
            "bandeira": "assets/bandeiras-paises/nl.jpg",
            "opcoes": [
                "Holanda",
                "Índia",
                "Países Baixos",
                "Canadá"
            ]
        },
        {
            "id": 171,
            "sigla": "no",
            "nome": "Noruega",
            "bandeira": "assets/bandeiras-paises/no.jpg",
            "opcoes": [
                "China",
                "África do Sul",
                "México",
                "Noruega"
            ]
        },
        {
            "id": 172,
            "sigla": "np",
            "nome": "Nepal",
            "bandeira": "assets/bandeiras-paises/np.jpg",
            "opcoes": [
                "Nepal",
                "Nova Zelândia",
                "Portugal",
                "Espanha"
            ]
        },
        {
            "id": 173,
            "sigla": "nr",
            "nome": "Nauru",
            "bandeira": "assets/bandeiras-paises/nr.jpg",
            "opcoes": [
                "Nauru",
                "Egito",
                "Sérvia",
                "França"
            ]
        },
        {
            "id": 174,
            "sigla": "nu",
            "nome": "Niue",
            "bandeira": "assets/bandeiras-paises/nu.jpg",
            "opcoes": [
                "Bélgica",
                "Suíça",
                "Niue",
                "Dinamarca"
            ]
        },
        {
            "id": 175,
            "sigla": "nz",
            "nome": "Nova Zelândia",
            "bandeira": "assets/bandeiras-paises/nz.jpg",
            "opcoes": [
                "Japão",
                "Nova Zelândia",
                "Suíça",
                "Arábia Saudita"
            ]
        },
        {
            "id": 176,
            "sigla": "om",
            "nome": "Omã",
            "bandeira": "assets/bandeiras-paises/om.jpg",
            "opcoes": [
                "Finlândia",
                "Portugal",
                "Omã",
                "Malásia"
            ]
        },
        {
            "id": 177,
            "sigla": "pa",
            "nome": "Panamá",
            "bandeira": "assets/bandeiras-paises/pa.jpg",
            "opcoes": [
                "Panamá",
                "Bélgica",
                "Noruega",
                "Tailândia"
            ]
        },
        {
            "id": 178,
            "sigla": "pe",
            "nome": "Peru",
            "bandeira": "assets/bandeiras-paises/pe.jpg",
            "opcoes": [
                "Dinamarca",
                "Suécia",
                "Bélgica",
                "Peru"
            ]
        },
        {
            "id": 179,
            "sigla": "pf",
            "nome": "Polinésia Francesa",
            "bandeira": "assets/bandeiras-paises/pf.jpg",
            "opcoes": [
                "Coreia do Sul",
                "Polinésia Francesa",
                "Nova Zelândia",
                "França"
            ]
        },
        {
            "id": 180,
            "sigla": "pg",
            "nome": "Papua Nova Guiné",
            "bandeira": "assets/bandeiras-paises/pg.jpg",
            "opcoes": [
                "Papua Nova Guiné",
                "Malásia",
                "África do Sul",
                "Chile"
            ]
        },
        {
            "id": 181,
            "sigla": "ph",
            "nome": "Filipinas",
            "bandeira": "assets/bandeiras-paises/ph.jpg",
            "opcoes": [
                "Canadá",
                "Argentina",
                "Suécia",
                "Filipinas"
            ]
        },
        {
            "id": 182,
            "sigla": "pk",
            "nome": "Paquistão",
            "bandeira": "assets/bandeiras-paises/pk.jpg",
            "opcoes": [
                "Peru",
                "Paquistão",
                "Países Baixos",
                "Índia"
            ]
        },
        {
            "id": 183,
            "sigla": "pl",
            "nome": "Polônia",
            "bandeira": "assets/bandeiras-paises/pl.jpg",
            "opcoes": [
                "Irlanda",
                "China",
                "Polônia",
                "Dinamarca"
            ]
        },
        {
            "id": 184,
            "sigla": "pm",
            "nome": "São Pedro e Miquelon",
            "bandeira": "assets/bandeiras-paises/pm.jpg",
            "opcoes": [
                "São Pedro e Miquelon",
                "Argentina",
                "Espanha",
                "Vietnã"
            ]
        },
        {
            "id": 185,
            "sigla": "pn",
            "nome": "Pitcairn",
            "bandeira": "assets/bandeiras-paises/pn.jpg",
            "opcoes": [
                "Pitcairn",
                "Egito",
                "Canadá",
                "Finlândia"
            ]
        },
        {
            "id": 186,
            "sigla": "pr",
            "nome": "Porto Rico",
            "bandeira": "assets/bandeiras-paises/pr.jpg",
            "opcoes": [
                "Suécia",
                "Polônia",
                "Finlândia",
                "Porto Rico"
            ]
        },
        {
            "id": 187,
            "sigla": "ps",
            "nome": "Territórios Palestinos",
            "bandeira": "assets/bandeiras-paises/ps.jpg",
            "opcoes": [
                "Territórios Palestinos",
                "Áustria",
                "Austrália",
                "França"
            ]
        },
        {
            "id": 188,
            "sigla": "pt",
            "nome": "Portugal",
            "bandeira": "assets/bandeiras-paises/pt.jpg",
            "opcoes": [
                "Índia",
                "Portugal",
                "Alemanha",
                "Tailândia"
            ]
        },
        {
            "id": 189,
            "sigla": "pw",
            "nome": "Palau",
            "bandeira": "assets/bandeiras-paises/pw.jpg",
            "opcoes": [
                "Palau",
                "Turquia",
                "Dinamarca",
                "Colômbia"
            ]
        },
        {
            "id": 190,
            "sigla": "py",
            "nome": "Paraguai",
            "bandeira": "assets/bandeiras-paises/py.jpg",
            "opcoes": [
                "Alemanha",
                "Paraguai",
                "África do Sul",
                "Japão"
            ]
        },
        {
            "id": 191,
            "sigla": "qa",
            "nome": "Catar",
            "bandeira": "assets/bandeiras-paises/qa.jpg",
            "opcoes": [
                "Catar",
                "Itália",
                "Indonésia",
                "Tailândia"
            ]
        },
        {
            "id": 192,
            "sigla": "re",
            "nome": "Reunião",
            "bandeira": "assets/bandeiras-paises/re.jpg",
            "opcoes": [
                "Suíça",
                "Reunião",
                "Arábia Saudita",
                "Suécia"
            ]
        },
        {
            "id": 193,
            "sigla": "ro",
            "nome": "Romênia",
            "bandeira": "assets/bandeiras-paises/ro.jpg",
            "opcoes": [
                "Nova Zelândia",
                "Suíça",
                "Grécia",
                "Romênia"
            ]
        },
        {
            "id": 194,
            "sigla": "rs",
            "nome": "Sérvia",
            "bandeira": "assets/bandeiras-paises/rs.jpg",
            "opcoes": [
                "Brasil",
                "Andorra",
                "Sérvia",
                "Suíça"
            ]
        },
        {
            "id": 195,
            "sigla": "ru",
            "nome": "Rússia",
            "bandeira": "assets/bandeiras-paises/ru.jpg",
            "opcoes": [
                "Indonésia",
                "Rússia",
                "Irlanda",
                "Itália"
            ]
        },
        {
            "id": 196,
            "sigla": "rw",
            "nome": "Ruanda",
            "bandeira": "assets/bandeiras-paises/rw.jpg",
            "opcoes": [
                "Canadá",
                "Indonésia",
                "Ruanda",
                "Portugal"
            ]
        },
        {
            "id": 197,
            "sigla": "sa",
            "nome": "Arábia Saudita",
            "bandeira": "assets/bandeiras-paises/sa.jpg",
            "opcoes": [
                "China",
                "Austrália",
                "Arábia Saudita",
                "Tailândia"
            ]
        },
        {
            "id": 198,
            "sigla": "sb",
            "nome": "Ilhas Salomão",
            "bandeira": "assets/bandeiras-paises/sb.jpg",
            "opcoes": [
                "Grécia",
                "China",
                "Egito",
                "Ilhas Salomão"
            ]
        },
        {
            "id": 199,
            "sigla": "sc",
            "nome": "Seychelles",
            "bandeira": "assets/bandeiras-paises/sc.jpg",
            "opcoes": [
                "Suíça",
                "Seychelles",
                "Itália",
                "Irlanda"
            ]
        },
        {
            "id": 200,
            "sigla": "sd",
            "nome": "Sudão",
            "bandeira": "assets/bandeiras-paises/sd.jpg",
            "opcoes": [
                "Sudão",
                "Tailândia",
                "Áustria",
                "Arábia Saudita"
            ]
        },
        {
            "id": 201,
            "sigla": "se",
            "nome": "Suécia",
            "bandeira": "assets/bandeiras-paises/se.jpg",
            "opcoes": [
                "Suécia",
                "Arábia Saudita",
                "Itália",
                "Peru"
            ]
        },
        {
            "id": 202,
            "sigla": "sg",
            "nome": "Cingapura",
            "bandeira": "assets/bandeiras-paises/sg.jpg",
            "opcoes": [
                "Brasil",
                "Nova Zelândia",
                "Polônia",
                "Cingapura"
            ]
        },
        {
            "id": 203,
            "sigla": "sh",
            "nome": "Santa Helena",
            "bandeira": "assets/bandeiras-paises/sh.jpg",
            "opcoes": [
                "Colômbia",
                "Santa Helena",
                "Malásia",
                "Canadá"
            ]
        },
        {
            "id": 204,
            "sigla": "si",
            "nome": "Eslovênia",
            "bandeira": "assets/bandeiras-paises/si.jpg",
            "opcoes": [
                "Canadá",
                "Argentina",
                "Bélgica",
                "Eslovênia"
            ]
        },
        {
            "id": 205,
            "sigla": "sj",
            "nome": "Svalbard e Jan Mayen",
            "bandeira": "assets/bandeiras-paises/sj.jpg",
            "opcoes": [
                "Países Baixos",
                "África do Sul",
                "Svalbard e Jan Mayen",
                "México"
            ]
        },
        {
            "id": 206,
            "sigla": "sk",
            "nome": "Eslováquia",
            "bandeira": "assets/bandeiras-paises/sk.jpg",
            "opcoes": [
                "Eslováquia",
                "Peru",
                "Dinamarca",
                "Brasil"
            ]
        },
        {
            "id": 207,
            "sigla": "sl",
            "nome": "Serra Leoa",
            "bandeira": "assets/bandeiras-paises/sl.jpg",
            "opcoes": [
                "Grécia",
                "Índia",
                "Serra Leoa",
                "Rússia"
            ]
        },
        {
            "id": 208,
            "sigla": "sm",
            "nome": "San Marino",
            "bandeira": "assets/bandeiras-paises/sm.jpg",
            "opcoes": [
                "Portugal",
                "Polônia",
                "Irlanda",
                "San Marino"
            ]
        },
        {
            "id": 209,
            "sigla": "sn",
            "nome": "Senegal",
            "bandeira": "assets/bandeiras-paises/sn.jpg",
            "opcoes": [
                "Argentina",
                "Finlândia",
                "Alemanha",
                "Senegal"
            ]
        },
        {
            "id": 210,
            "sigla": "so",
            "nome": "Somália",
            "bandeira": "assets/bandeiras-paises/so.jpg",
            "opcoes": [
                "Irlanda",
                "Somália",
                "Colômbia",
                "Indonésia"
            ]
        },
        {
            "id": 211,
            "sigla": "sr",
            "nome": "Suriname",
            "bandeira": "assets/bandeiras-paises/sr.jpg",
            "opcoes": [
                "Andorra",
                "Indonésia",
                "Suriname",
                "Arábia Saudita"
            ]
        },
        {
            "id": 212,
            "sigla": "ss",
            "nome": "Sudão do Sul",
            "bandeira": "assets/bandeiras-paises/ss.jpg",
            "opcoes": [
                "Colômbia",
                "Sudão do Sul",
                "Brasil",
                "Japão"
            ]
        },
        {
            "id": 213,
            "sigla": "st",
            "nome": "São Tomé e Príncipe",
            "bandeira": "assets/bandeiras-paises/st.jpg",
            "opcoes": [
                "Bélgica",
                "São Tomé e Príncipe",
                "África do Sul",
                "Áustria"
            ]
        },
        {
            "id": 214,
            "sigla": "sv",
            "nome": "El Salvador",
            "bandeira": "assets/bandeiras-paises/sv.jpg",
            "opcoes": [
                "El Salvador",
                "Finlândia",
                "China",
                "Indonésia"
            ]
        },
        {
            "id": 215,
            "sigla": "sx",
            "nome": "Sint Maarten",
            "bandeira": "assets/bandeiras-paises/sx.jpg",
            "opcoes": [
                "Tailândia",
                "Sint Maarten",
                "Peru",
                "Colômbia"
            ]
        },
        {
            "id": 216,
            "sigla": "sy",
            "nome": "Síria",
            "bandeira": "assets/bandeiras-paises/sy.jpg",
            "opcoes": [
                "Espanha",
                "Andorra",
                "Síria",
                "Filipinas"
            ]
        },
        {
            "id": 217,
            "sigla": "sz",
            "nome": "Eswatini",
            "bandeira": "assets/bandeiras-paises/sz.jpg",
            "opcoes": [
                "Grécia",
                "Eswatini",
                "Malásia",
                "Noruega"
            ]
        },
        {
            "id": 218,
            "sigla": "tc",
            "nome": "Ilhas Turks e Caicos",
            "bandeira": "assets/bandeiras-paises/tc.jpg",
            "opcoes": [
                "Peru",
                "Filipinas",
                "Ilhas Turks e Caicos",
                "Finlândia"
            ]
        },
        {
            "id": 219,
            "sigla": "td",
            "nome": "Chade",
            "bandeira": "assets/bandeiras-paises/td.jpg",
            "opcoes": [
                "Portugal",
                "Dinamarca",
                "Filipinas",
                "Chade"
            ]
        },
        {
            "id": 220,
            "sigla": "tf",
            "nome": "Terras Austrais e Antárticas Francesas",
            "bandeira": "assets/bandeiras-paises/tf.jpg",
            "opcoes": [
                "Polônia",
                "Terras Austrais e Antárticas Francesas",
                "Sérvia",
                "Portugal"
            ]
        },
        {
            "id": 221,
            "sigla": "tg",
            "nome": "Togo",
            "bandeira": "assets/bandeiras-paises/tg.jpg",
            "opcoes": [
                "Canadá",
                "Togo",
                "Argentina",
                "Austrália"
            ]
        },
        {
            "id": 222,
            "sigla": "th",
            "nome": "Tailândia",
            "bandeira": "assets/bandeiras-paises/th.jpg",
            "opcoes": [
                "Áustria",
                "Austrália",
                "Dinamarca",
                "Tailândia"
            ]
        },
        {
            "id": 223,
            "sigla": "tj",
            "nome": "Tadjiquistão",
            "bandeira": "assets/bandeiras-paises/tj.jpg",
            "opcoes": [
                "Bélgica",
                "China",
                "Tadjiquistão",
                "Vietnã"
            ]
        },
        {
            "id": 224,
            "sigla": "tk",
            "nome": "Tokelau",
            "bandeira": "assets/bandeiras-paises/tk.jpg",
            "opcoes": [
                "França",
                "Portugal",
                "Japão",
                "Tokelau"
            ]
        },
        {
            "id": 225,
            "sigla": "tl",
            "nome": "Timor-Leste",
            "bandeira": "assets/bandeiras-paises/tl.jpg",
            "opcoes": [
                "Timor-Leste",
                "Irlanda",
                "Egito",
                "Coreia do Sul"
            ]
        },
        {
            "id": 226,
            "sigla": "tm",
            "nome": "Turcomenistão",
            "bandeira": "assets/bandeiras-paises/tm.jpg",
            "opcoes": [
                "Argentina",
                "Turcomenistão",
                "Andorra",
                "Áustria"
            ]
        },
        {
            "id": 227,
            "sigla": "tn",
            "nome": "Tunísia",
            "bandeira": "assets/bandeiras-paises/tn.jpg",
            "opcoes": [
                "Tunísia",
                "Irlanda",
                "Malásia",
                "Índia"
            ]
        },
        {
            "id": 228,
            "sigla": "to",
            "nome": "Tonga",
            "bandeira": "assets/bandeiras-paises/to.jpg",
            "opcoes": [
                "Tonga",
                "Turquia",
                "Andorra",
                "Bélgica"
            ]
        },
        {
            "id": 229,
            "sigla": "tr",
            "nome": "Turquia",
            "bandeira": "assets/bandeiras-paises/tr.jpg",
            "opcoes": [
                "Turquia",
                "Alemanha",
                "China",
                "Brasil"
            ]
        },
        {
            "id": 230,
            "sigla": "tt",
            "nome": "Trinidad e Tobago",
            "bandeira": "assets/bandeiras-paises/tt.jpg",
            "opcoes": [
                "Trinidad e Tobago",
                "Malásia",
                "Itália",
                "Dinamarca"
            ]
        },
        {
            "id": 231,
            "sigla": "tv",
            "nome": "Tuvalu",
            "bandeira": "assets/bandeiras-paises/tv.jpg",
            "opcoes": [
                "Argentina",
                "Índia",
                "Tuvalu",
                "Grécia"
            ]
        },
        {
            "id": 232,
            "sigla": "tw",
            "nome": "Taiwan",
            "bandeira": "assets/bandeiras-paises/tw.jpg",
            "opcoes": [
                "Índia",
                "Vietnã",
                "Alemanha",
                "Taiwan"
            ]
        },
        {
            "id": 233,
            "sigla": "tz",
            "nome": "Tanzânia",
            "bandeira": "assets/bandeiras-paises/tz.jpg",
            "opcoes": [
                "Coreia do Sul",
                "Tanzânia",
                "França",
                "Peru"
            ]
        },
        {
            "id": 234,
            "sigla": "ua",
            "nome": "Ucrânia",
            "bandeira": "assets/bandeiras-paises/ua.jpg",
            "opcoes": [
                "Ucrânia",
                "Andorra",
                "Espanha",
                "Malásia"
            ]
        },
        {
            "id": 235,
            "sigla": "ug",
            "nome": "Uganda",
            "bandeira": "assets/bandeiras-paises/ug.jpg",
            "opcoes": [
                "Países Baixos",
                "Coreia do Sul",
                "Peru",
                "Uganda"
            ]
        },
        {
            "id": 236,
            "sigla": "um",
            "nome": "Ilhas Menores Distantes dos EUA",
            "bandeira": "assets/bandeiras-paises/um.jpg",
            "opcoes": [
                "Rússia",
                "Ilhas Menores Distantes dos EUA",
                "África do Sul",
                "Japão"
            ]
        },
        {
            "id": 237,
            "sigla": "us",
            "nome": "Estados Unidos",
            "bandeira": "assets/bandeiras-paises/us.jpg",
            "opcoes": [
                "Andorra",
                "Espanha",
                "Brasil",
                "Estados Unidos"
            ]
        },
        {
            "id": 238,
            "sigla": "uy",
            "nome": "Uruguai",
            "bandeira": "assets/bandeiras-paises/uy.jpg",
            "opcoes": [
                "Filipinas",
                "Uruguai",
                "Irlanda",
                "Argentina"
            ]
        },
        {
            "id": 239,
            "sigla": "uz",
            "nome": "Uzbequistão",
            "bandeira": "assets/bandeiras-paises/uz.jpg",
            "opcoes": [
                "Polônia",
                "Colômbia",
                "Vietnã",
                "Uzbequistão"
            ]
        },
        {
            "id": 240,
            "sigla": "va",
            "nome": "Vaticano",
            "bandeira": "assets/bandeiras-paises/va.jpg",
            "opcoes": [
                "Vaticano",
                "Nova Zelândia",
                "Alemanha",
                "Brasil"
            ]
        },
        {
            "id": 241,
            "sigla": "vc",
            "nome": "São Vicente e Granadinas",
            "bandeira": "assets/bandeiras-paises/vc.jpg",
            "opcoes": [
                "São Vicente e Granadinas",
                "Finlândia",
                "Portugal",
                "Sérvia"
            ]
        },
        {
            "id": 242,
            "sigla": "ve",
            "nome": "Venezuela",
            "bandeira": "assets/bandeiras-paises/ve.jpg",
            "opcoes": [
                "Filipinas",
                "África do Sul",
                "Coreia do Sul",
                "Venezuela"
            ]
        },
        {
            "id": 243,
            "sigla": "vg",
            "nome": "Ilhas Virgens Britânicas",
            "bandeira": "assets/bandeiras-paises/vg.jpg",
            "opcoes": [
                "Turquia",
                "Suécia",
                "Grécia",
                "Ilhas Virgens Britânicas"
            ]
        },
        {
            "id": 244,
            "sigla": "vi",
            "nome": "Ilhas Virgens Americanas",
            "bandeira": "assets/bandeiras-paises/vi.jpg",
            "opcoes": [
                "Finlândia",
                "França",
                "Indonésia",
                "Ilhas Virgens Americanas"
            ]
        },
        {
            "id": 245,
            "sigla": "vn",
            "nome": "Vietnã",
            "bandeira": "assets/bandeiras-paises/vn.jpg",
            "opcoes": [
                "Chile",
                "Itália",
                "Vietnã",
                "Turquia"
            ]
        },
        {
            "id": 246,
            "sigla": "vu",
            "nome": "Vanuatu",
            "bandeira": "assets/bandeiras-paises/vu.jpg",
            "opcoes": [
                "Tailândia",
                "China",
                "Vanuatu",
                "Noruega"
            ]
        },
        {
            "id": 247,
            "sigla": "wf",
            "nome": "Wallis e Futuna",
            "bandeira": "assets/bandeiras-paises/wf.jpg",
            "opcoes": [
                "Wallis e Futuna",
                "Austrália",
                "Indonésia",
                "África do Sul"
            ]
        },
        {
            "id": 248,
            "sigla": "ws",
            "nome": "Samoa",
            "bandeira": "assets/bandeiras-paises/ws.jpg",
            "opcoes": [
                "África do Sul",
                "Filipinas",
                "Austrália",
                "Samoa"
            ]
        },
        {
            "id": 249,
            "sigla": "xk",
            "nome": "Kosovo",
            "bandeira": "assets/bandeiras-paises/xk.jpg",
            "opcoes": [
                "Áustria",
                "Alemanha",
                "Finlândia",
                "Kosovo"
            ]
        },
        {
            "id": 250,
            "sigla": "ye",
            "nome": "Iêmen",
            "bandeira": "assets/bandeiras-paises/ye.jpg",
            "opcoes": [
                "Iêmen",
                "Vietnã",
                "Colômbia",
                "Noruega"
            ]
        },
        {
            "id": 251,
            "sigla": "yt",
            "nome": "Mayotte",
            "bandeira": "assets/bandeiras-paises/yt.jpg",
            "opcoes": [
                "França",
                "Grécia",
                "Áustria",
                "Mayotte"
            ]
        },
        {
            "id": 252,
            "sigla": "za",
            "nome": "África do Sul",
            "bandeira": "assets/bandeiras-paises/za.jpg",
            "opcoes": [
                "África do Sul",
                "Argentina",
                "Arábia Saudita",
                "Índia"
            ]
        },
        {
            "id": 253,
            "sigla": "zm",
            "nome": "Zâmbia",
            "bandeira": "assets/bandeiras-paises/zm.jpg",
            "opcoes": [
                "Zâmbia",
                "Malásia",
                "Arábia Saudita",
                "Indonésia"
            ]
        },
        {
            "id": 254,
            "sigla": "zw",
            "nome": "Zimbábue",
            "bandeira": "assets/bandeiras-paises/zw.jpg",
            "opcoes": [
                "Colômbia",
                "Zimbábue",
                "Espanha",
                "Alemanha"
            ]
        }
  ];

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.time;
    _currentIndex = Random().nextInt(_questions.length); // Gera um índice inicial aleatório
    _startTimer();
    _buttonColors = List.generate(4, (index) => Colors.blue); // Inicializa as cores dos botões com azul
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _endGame();
      }
    });
  }

  void _endGame() {
    _timer?.cancel();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Jogo Finalizado!'),
          content: Text('Você acertou $_score de ${_questions.length} perguntas.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('Sair'),
            ),
          ],
        );
      },
    );
  }

  void _checkAnswer(String selectedOption, int index) {
    bool isCorrect = _questions[_currentIndex]['nome'] == selectedOption;
    setState(() {
      _buttonColors[index] = isCorrect ? Colors.green : Colors.red; // Modifica a cor do botão pressionado
      if (isCorrect) {
        _score++;
      }
    });

    // Espera um segundo para passar para a próxima pergunta
    Future.delayed(const Duration(seconds: 1), () {
      _nextQuestion();
    });
  }

  void _nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex = Random().nextInt(_questions.length); // Gera um novo índice aleatório
        _buttonColors = List.generate(4, (index) => Colors.blue); // Reseta as cores dos botões para azul
      });
    } else {
      _endGame();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flag Play'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Tempo restante: $_remainingTime segundos',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200.0,  // Largura da imagem
              height: 270.0,  // Altura da imagem
              child: Image.asset(currentQuestion['bandeira']),
            ),
            const SizedBox(height: 20),
            ...currentQuestion['opcoes'].asMap().entries.map<Widget>((entry) {
              int index = entry.key;
              String option = entry.value;
              return Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(350.0, 50.0),  // Largura e altura mínimas do botão
                      backgroundColor: _buttonColors[index], // Usa a cor armazenada no botão
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => _checkAnswer(option, index),
                    child: Text(option),
                  ),
                  const SizedBox(height: 8.0),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

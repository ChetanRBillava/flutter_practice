import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../presentation/utils/custom_print.dart';
import '../http/http_client.dart';
import '../models/random_jokes_model.dart';

class RandomJokesRepository{
  final headers = {HttpHeaders.contentTypeHeader: 'application/json'};

  Future<List> fetchJokesAPI() async {
    customPrint.myCustomPrint('Retrieving branch list......');
    try {
      customPrint.myCustomPrint(randomJokesURL);
      var response = await http.get(Uri.parse(randomJokesURL), headers: headers);
      customPrint.myCustomPrint('Response status code: ${response.statusCode}');
      customPrint.myCustomPrint(response.body);

      if(response.statusCode == 200){

        final baseApiData = jsonDecode(response.body);
        var temp ={
          {'id': 1,'type': 'none', 'setup':'none', 'punchline':'none'},
        };
        temp={};
        temp.add({
          'id':baseApiData['id'],
          'type':baseApiData['type'],
          'setup':baseApiData['setup'],
          'punchline':baseApiData['punchline'],
        });
        return ['200',temp.map((e) => RandomJokesList.fromJson(e)).toList()];
      }
      else if(response.statusCode == 400){
        return ['400', 'Could not fetch data'];
      }
      else{
        return ['500', 'Server error'];
      }
    }  on SocketException catch (e) {
      return ['501', 'Socket Exception'];
    } on HttpException catch (e) {
      return ['502', 'Http Exception'];
    } on FormatException catch (e) {
      return ['503', 'Format Exception'];
    }
  }
}
import 'package:flutter/material.dart';

class APIResponse<T>{
  T data;
  bool error;
  String errorMessage;

  APIResponse({
  this.data,
  this.error = false,
  this.errorMessage
  });

}
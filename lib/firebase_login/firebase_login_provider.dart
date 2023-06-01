import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_demo/Utils/authentication.dart';

final authProvider = Provider((_)=> Authentication());
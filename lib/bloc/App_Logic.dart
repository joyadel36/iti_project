import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'App_State.dart';
class Appcubit extends Cubit<BuyState>
{
  Appcubit() : super(InitState());

  static Appcubit getobject(BuildContext context)
  {
    return BlocProvider.of(context);
  }

  int num_Items=0;
  List cart_items=[];
  void Increase_ele(var item)
  {
    cart_items.add(item);
    print(cart_items);
    num_Items++;
    emit(Plus());
  }
  void decrease_ele(Map item)
  {
    if(num_Items==0||cart_items.isEmpty)
    {

    }
    else
    {
      cart_items.remove(item);
      num_Items--;
    }
    emit(Minus());
  }

}
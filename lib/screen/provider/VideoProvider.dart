
import 'package:flutter/cupertino.dart';

class VideoProvider extends ChangeNotifier
{
  List shortList= [];
  int addIndex=0;
  bool playing=true;
  bool likethis=true;

  void Video (int index)
  {
    addIndex=index;
    notifyListeners();
  }


  void PlayVideo ()
  {
    playing=!playing;
    notifyListeners();
  }

}
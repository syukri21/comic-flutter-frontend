import 'package:comic/global/popup-menu-item-text/index.dart';
import 'package:comic/page/home/new-update/bloc/bloc.dart';
import 'package:comic/page/home/new-update/count-new-update.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const count = 900;

class Appbar extends StatelessWidget {
  const Appbar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Count(),
          BlocListener<NewUpdateBloc, NewUpdateState>(
            listener: (BuildContext context, NewUpdateState state) {},
            child: BlocBuilder<NewUpdateBloc, NewUpdateState>(
              builder: (BuildContext context, NewUpdateState state) {
                int selectedValue = 0;
                if (state is ChangedNewUpdateSortBy) {
                  selectedValue = state.value;
                }
                return NewUpdatePopupMenuButton(selectedValue: selectedValue);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NewUpdatePopupMenuButton extends StatelessWidget {
  const NewUpdatePopupMenuButton({
    Key key,
    this.selectedValue,
  }) : super(key: key);

  final int selectedValue;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      elevation: 10,
      child: Container(
        width: 50,
        alignment: Alignment.centerRight,
        child: Icon(Icons.filter_list),
      ),
      padding: const EdgeInsets.all(0),
      // initialValue: defaultState,
      onSelected: (value) => _handleSortMenuBy(context: context, value: value),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          enabled: false,
          value: -1,
          child: Text(
            'Sort By',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          value: 0,
          child: PopupMenuItemText(
            title: "Name",
            isActive: selectedValue == 0,
          ),
        ),
        PopupMenuItem(
          value: 1,
          child: PopupMenuItemText(
            title: "Rating",
            isActive: selectedValue == 1,
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: PopupMenuItemText(
            title: "Last Update",
            isActive: selectedValue == 2,
          ),
        ),
      ],
    );
  }

  void _handleSortMenuBy({BuildContext context, int value}) {
    final NewUpdateBloc newUpdateBloc = BlocProvider.of<NewUpdateBloc>(context);
    newUpdateBloc.dispatch(OnChangeNewUpdateSortBy(value));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/main/data/enum/character_status.dart';
import 'package:rick_and_morty/features/main/presentation/bloc/favorite_character_bloc.dart';

class StatusDropdown extends StatelessWidget {
  const StatusDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCharacterBloc, FavoriteCharacterState>(
      builder: (context, state) {
        if (state is FavoriteCharacterLoaded) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.purple),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<CharacterStatus>(
                value: state.selectedStatus,
                items:
                    CharacterStatus.values.map((status) {
                      return DropdownMenuItem(
                        value: status,
                        child: Text(
                          status.label,
                          style: const TextStyle(color: Colors.purple),
                        ),
                      );
                    }).toList(),
                dropdownColor: Colors.white,
                iconEnabledColor: Colors.purple,
                elevation: 0,
                borderRadius: BorderRadius.circular(8),
                onChanged: (status) {
                  if (status != null) {
                    context.read<FavoriteCharacterBloc>().add(
                      FilterFavoriteCharactersByStatus(status),
                    );
                  }
                },
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

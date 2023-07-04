import 'package:crypto_list/core/injection_container.dart';
import 'package:crypto_list/core/utils/date_time_format.dart';
import 'package:crypto_list/features/crypto/bloc/crypto_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoScreen extends StatelessWidget {
  const CryptoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CryptoBloc>(),
      child: const CryptoListView(),
    );
  }
}

class CryptoListView extends StatelessWidget {
  const CryptoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crypto App')),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              _InputWithButton(),
              SizedBox(height: 16),
              Expanded(child: _List()),
            ],
          ),
        ),
      ),
    );
  }
}

class _InputWithButton extends StatefulWidget {
  const _InputWithButton();

  @override
  State<_InputWithButton> createState() => _InputWithButtonState();
}

class _InputWithButtonState extends State<_InputWithButton> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  String refreshText = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoBloc, CryptoState>(
      builder: (context, state) {
        return Column(
          children: [
            TextFormField(
              controller: textEditingController,
              onChanged: (value) {
                setState(() {});
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: textEditingController.text == ''
                      ? null
                      : () {
                          final CryptoBloc bloc = context.read<CryptoBloc>();
                          bloc.add(CryptoLoadEvent(
                              input: textEditingController.text));
                          refreshText = textEditingController.text;
                        },
                  child: const Text('Load'),
                ),
                ElevatedButton(
                  onPressed: refreshText == ''
                      ? null
                      : () {
                          final CryptoBloc bloc = context.read<CryptoBloc>();
                          bloc.add(CryptoLoadEvent(input: refreshText));
                        },
                  child: const Text('Refresh'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _List extends StatelessWidget {
  const _List();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoBloc, CryptoState>(
      builder: (context, state) {
        if (state is CryptoLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CryptoLoadedState) {
          final model = state.cryptoModel;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(model.uniqueReference ?? ''),
              const SizedBox(height: 8),
              Text(model.pair?.name ?? ''),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemCount: model.transactions?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return _Item(
                      createdOn: model.transactions?[index].createdOn,
                      txId: model.transactions?[index].txId,
                      amount: model.transactions?[index].amount,
                      isVerified: model.transactions?[index].isVerified,
                      isCompleted: model.transactions?[index].isCompleted,
                      time: model.transactions?[index].time,
                      currency: model.transactions?[index].currency,
                    );
                  },
                ),
              ),
            ],
          );
        }
        if (state is CryptoErrorState) {
          return Text(state.exception.toString());
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.createdOn,
    required this.txId,
    required this.amount,
    required this.isVerified,
    required this.isCompleted,
    required this.time,
    required this.currency,
  });

  final DateTime? createdOn;
  final String? txId;
  final String? amount;
  final bool? isVerified;
  final bool? isCompleted;
  final DateTime? time;
  final String? currency;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (txId != null) ...[
            Text(
                'TxId: ...${txId!.substring(txId!.length ~/ 1.5, txId!.length)}'),
          ],
          Text('Amount: ${amount ?? ''}'),
          Text('Is verified: ${isVerified.toString()}'),
          Text('Is completed: ${isCompleted.toString()}'),
          Text('Created on: ${DateTimeFormat.timeFormat(createdOn)}'),
          Text('Time: ${DateTimeFormat.timeFormat(time)}'),
        ],
      ),
    );
  }
}

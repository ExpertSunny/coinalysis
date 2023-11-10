class BitcoinTransaction {
  final String? hash160;
  final String address;
  final int nTx;
  final int nUnredeemed;
  final int totalReceived;
  final int totalSent;
  final int finalBalance;
  final List<TransactionDetail> transactions;

  BitcoinTransaction({
    this.hash160,
    required this.address,
    required this.nTx,
    required this.nUnredeemed,
    required this.totalReceived,
    required this.totalSent,
    required this.finalBalance,
    required this.transactions,
  });

  factory BitcoinTransaction.fromJson(Map<String, dynamic> json) {
    var transactionList = json['txs'] as List;
    List<TransactionDetail> transactions = transactionList
        .map((transaction) => TransactionDetail.fromJson(transaction))
        .toList();

    return BitcoinTransaction(
      hash160: json['hash160'],
      address: json['address'],
      nTx: json['n_tx'],
      nUnredeemed: json['n_unredeemed'],
      totalReceived: json['total_received'],
      totalSent: json['total_sent'],
      finalBalance: json['final_balance'],
      transactions: transactions,
    );
  }
}

class TransactionDetail {
  final String hash;
  final int ver;
  final int vinSz;
  final int voutSz;
  final int size;
  final int weight;
  final int fee;
  final String relayedBy;
  final int lockTime;
  final int txIndex;
  final bool doubleSpend;
  final int time;
  final List<TransactionInput> inputs;
  final List<TransactionOutput> outputs;
  final int result;
  final int balance;
  // final bool rbf;

  TransactionDetail({
    required this.hash,
    required this.ver,
    required this.vinSz,
    required this.voutSz,
    required this.size,
    required this.weight,
    required this.fee,
    required this.relayedBy,
    required this.lockTime,
    required this.txIndex,
    required this.doubleSpend,
    required this.time,
    required this.inputs,
    required this.outputs,
    required this.result,
    required this.balance,
    // required this.rbf,
  });

  factory TransactionDetail.fromJson(Map<String, dynamic> json) {
    var inputList = json['inputs'] as List;
    List<TransactionInput> inputs =
        inputList.map((input) => TransactionInput.fromJson(input)).toList();

    var outputList = json['out'] as List;
    List<TransactionOutput> outputs =
        outputList.map((output) => TransactionOutput.fromJson(output)).toList();

    return TransactionDetail(
      hash: json['hash'],
      ver: json['ver'],
      vinSz: json['vin_sz'],
      voutSz: json['vout_sz'],
      size: json['size'],
      weight: json['weight'],
      fee: json['fee'],
      relayedBy: json['relayed_by'],
      lockTime: json['lock_time'],
      txIndex: json['tx_index'],
      doubleSpend: json['double_spend'],
      time: json['time'],
      inputs: inputs,
      outputs: outputs,
      result: json['result'],
      balance: json['balance'],
      // rbf: json['rbf'],
    );
  }
}

class TransactionInput {
  final int sequence;
  final String witness;
  final int index;
  final PreviousOutput prevOut;

  TransactionInput({
    required this.sequence,
    required this.witness,
    required this.index,
    required this.prevOut,
  });

  factory TransactionInput.fromJson(Map<String, dynamic> json) {
    return TransactionInput(
      sequence: json['sequence'],
      witness: json['witness'],
      index: json['index'],
      prevOut: PreviousOutput.fromJson(json['prev_out']),
    );
  }
}

class PreviousOutput {
  final String addr;
  final int n;
  final String script;
  final List<SpendingOutpoint> spendingOutpoints;
  final bool spent;
  final int txIndex;
  final int type;
  final int value;

  PreviousOutput({
    required this.addr,
    required this.n,
    required this.script,
    required this.spendingOutpoints,
    required this.spent,
    required this.txIndex,
    required this.type,
    required this.value,
  });

  factory PreviousOutput.fromJson(Map<String, dynamic> json) {
    var spendingOutpointList = json['spending_outpoints'] as List;
    List<SpendingOutpoint> spendingOutpoints = spendingOutpointList
        .map((outpoint) => SpendingOutpoint.fromJson(outpoint))
        .toList();

    return PreviousOutput(
      addr: json['addr'],
      n: json['n'],
      script: json['script'],
      spendingOutpoints: spendingOutpoints,
      spent: json['spent'],
      txIndex: json['tx_index'],
      type: json['type'],
      value: json['value'],
    );
  }
}

class SpendingOutpoint {
  final int n;
  final int txIndex;

  SpendingOutpoint({
    required this.n,
    required this.txIndex,
  });

  factory SpendingOutpoint.fromJson(Map<String, dynamic> json) {
    return SpendingOutpoint(
      n: json['n'],
      txIndex: json['tx_index'],
    );
  }
}

class TransactionOutput {
  final int type;
  final bool spent;
  final int value;
  final List<SpendingOutpoint> spendingOutpoints;
  final int n;
  final int txIndex;
  final String script;
  final String addr;

  TransactionOutput({
    required this.type,
    required this.spent,
    required this.value,
    required this.spendingOutpoints,
    required this.n,
    required this.txIndex,
    required this.script,
    required this.addr,
  });

  factory TransactionOutput.fromJson(Map<String, dynamic> json) {
    var spendingOutpointList = json['spending_outpoints'] as List;
    List<SpendingOutpoint> spendingOutpoints = spendingOutpointList
        .map((outpoint) => SpendingOutpoint.fromJson(outpoint))
        .toList();

    return TransactionOutput(
      type: json['type'],
      spent: json['spent'],
      value: json['value'],
      spendingOutpoints: spendingOutpoints,
      n: json['n'],
      txIndex: json['tx_index'],
      script: json['script'],
      addr: json['addr'],
    );
  }
}

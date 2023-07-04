class CryptoModel {
  double? orderType;
  String? amountBase;
  bool? isDefaultRule;
  String? uniqueReference;
  String? amountQuote;
  Pair? pair;
  WithdrawAddress? withdrawAddress;
  dynamic refundAddress;
  bool? userMarkedAsPaid;
  dynamic depositAddress;
  String? createdOn;
  bool? fromDefaultRule;
  double? paymentWindow;
  String? paymentDeadline;
  String? kycDeadline;
  List<Transactions>? transactions;
  List<ReferralCode>? referralCode;
  double? withdrawalFee;
  double? withdrawalFeeQuote;
  double? userProvidedAmount;
  double? amountUsd;
  double? amountBtc;
  double? amountEur;
  double? amountQuoteFee;
  dynamic paymentUrl;
  bool? displayRefundAddress;
  Price? price;

  CryptoModel(
      {this.orderType,
      this.amountBase,
      this.isDefaultRule,
      this.uniqueReference,
      this.amountQuote,
      this.pair,
      this.withdrawAddress,
      this.refundAddress,
      this.userMarkedAsPaid,
      this.depositAddress,
      this.createdOn,
      this.fromDefaultRule,
      this.paymentWindow,
      this.paymentDeadline,
      this.kycDeadline,
      this.transactions,
      this.referralCode,
      this.withdrawalFee,
      this.withdrawalFeeQuote,
      this.userProvidedAmount,
      this.amountUsd,
      this.amountBtc,
      this.amountEur,
      this.amountQuoteFee,
      this.paymentUrl,
      this.displayRefundAddress,
      this.price});

  CryptoModel.fromJson(Map<String, dynamic> json) {
    orderType = json['order_type'].toDouble();
    amountBase = json['amount_base'];
    isDefaultRule = json['is_default_rule'];
    uniqueReference = json['unique_reference'];
    amountQuote = json['amount_quote'];
    pair = json['pair'] != null ? Pair.fromJson(json['pair']) : null;
    withdrawAddress = json['withdraw_address'] != null
        ? WithdrawAddress.fromJson(json['withdraw_address'])
        : null;
    refundAddress = json['refund_address'];
    userMarkedAsPaid = json['user_marked_as_paid'];
    depositAddress = json['deposit_address'];
    createdOn = json['created_on'];
    fromDefaultRule = json['from_default_rule'];
    paymentWindow = json['payment_window'].toDouble();
    paymentDeadline = json['payment_deadline'];
    kycDeadline = json['kyc_deadline'];
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(Transactions.fromJson(v));
      });
    }
    if (json['referral_code'] != null) {
      referralCode = <ReferralCode>[];
      json['referral_code'].forEach((v) {
        referralCode!.add(ReferralCode.fromJson(v));
      });
    }
    withdrawalFee = json['withdrawal_fee'].toDouble();
    withdrawalFeeQuote = json['withdrawal_fee_quote'].toDouble();
    userProvidedAmount = json['user_provided_amount'].toDouble();
    amountUsd = json['amount_usd'].toDouble();
    amountBtc = json['amount_btc'].toDouble();
    amountEur = json['amount_eur'].toDouble();
    amountQuoteFee = json['amount_quote_fee'].toDouble();
    paymentUrl = json['payment_url'];
    displayRefundAddress = json['display_refund_address'];
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
  }
}

class Pair {
  String? name;
  Base? base;
  Quote? quote;
  double? feeAsk;
  double? feeBid;

  Pair({this.name, this.base, this.quote, this.feeAsk, this.feeBid});

  Pair.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    base = json['base'] != null ? Base.fromJson(json['base']) : null;
    quote = json['quote'] != null ? Quote.fromJson(json['quote']) : null;
    feeAsk = json['fee_ask'].toDouble();
    feeBid = json['fee_bid'].toDouble();
  }
}

class Base {
  String? code;
  String? name;
  double? minConfirmations;
  bool? isCrypto;
  String? minimalAmount;
  String? maximalAmount;
  bool? isBaseOfEnabledPair;
  bool? isQuoteOfEnabledPair;
  bool? hasEnabledPairs;
  bool? isBaseOfEnabledPairForTest;
  bool? isQuoteOfEnabledPairForTest;
  bool? hasEnabledPairsForTest;
  String? withdrawalFee;
  dynamic extraId;
  Network? network;

  Base(
      {this.code,
      this.name,
      this.minConfirmations,
      this.isCrypto,
      this.minimalAmount,
      this.maximalAmount,
      this.isBaseOfEnabledPair,
      this.isQuoteOfEnabledPair,
      this.hasEnabledPairs,
      this.isBaseOfEnabledPairForTest,
      this.isQuoteOfEnabledPairForTest,
      this.hasEnabledPairsForTest,
      this.withdrawalFee,
      this.extraId,
      this.network});

  Base.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    minConfirmations = json['min_confirmations'].toDouble();
    isCrypto = json['is_crypto'];
    minimalAmount = json['minimal_amount'];
    maximalAmount = json['maximal_amount'];
    isBaseOfEnabledPair = json['is_base_of_enabled_pair'];
    isQuoteOfEnabledPair = json['is_quote_of_enabled_pair'];
    hasEnabledPairs = json['has_enabled_pairs'];
    isBaseOfEnabledPairForTest = json['is_base_of_enabled_pair_for_test'];
    isQuoteOfEnabledPairForTest = json['is_quote_of_enabled_pair_for_test'];
    hasEnabledPairsForTest = json['has_enabled_pairs_for_test'];
    withdrawalFee = json['withdrawal_fee'];
    extraId = json['extra_id'];
    network =
        json['network'] != null ? Network.fromJson(json['network']) : null;
  }
}

class Network {
  String? name;

  Network({this.name});

  Network.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}

class Quote {
  String? code;
  String? name;
  dynamic minConfirmations;
  bool? isCrypto;
  String? minimalAmount;
  String? maximalAmount;
  bool? isBaseOfEnabledPair;
  bool? isQuoteOfEnabledPair;
  bool? hasEnabledPairs;
  bool? isBaseOfEnabledPairForTest;
  bool? isQuoteOfEnabledPairForTest;
  bool? hasEnabledPairsForTest;
  String? withdrawalFee;
  dynamic extraId;
  dynamic network;

  Quote(
      {this.code,
      this.name,
      this.minConfirmations,
      this.isCrypto,
      this.minimalAmount,
      this.maximalAmount,
      this.isBaseOfEnabledPair,
      this.isQuoteOfEnabledPair,
      this.hasEnabledPairs,
      this.isBaseOfEnabledPairForTest,
      this.isQuoteOfEnabledPairForTest,
      this.hasEnabledPairsForTest,
      this.withdrawalFee,
      this.extraId,
      this.network});

  Quote.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    minConfirmations = json['min_confirmations'];
    isCrypto = json['is_crypto'];
    minimalAmount = json['minimal_amount'];
    maximalAmount = json['maximal_amount'];
    isBaseOfEnabledPair = json['is_base_of_enabled_pair'];
    isQuoteOfEnabledPair = json['is_quote_of_enabled_pair'];
    hasEnabledPairs = json['has_enabled_pairs'];
    isBaseOfEnabledPairForTest = json['is_base_of_enabled_pair_for_test'];
    isQuoteOfEnabledPairForTest = json['is_quote_of_enabled_pair_for_test'];
    hasEnabledPairsForTest = json['has_enabled_pairs_for_test'];
    withdrawalFee = json['withdrawal_fee'];
    extraId = json['extra_id'];
    network = json['network'];
  }
}

class WithdrawAddress {
  String? type;
  String? name;
  String? address;
  String? currencyCode;
  dynamic destinationTag;
  dynamic memo;
  dynamic extraId;

  WithdrawAddress(
      {this.type,
      this.name,
      this.address,
      this.currencyCode,
      this.destinationTag,
      this.memo,
      this.extraId});

  WithdrawAddress.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    address = json['address'];
    currencyCode = json['currency_code'];
    destinationTag = json['destination_tag'];
    memo = json['memo'];
    extraId = json['extra_id'];
  }
}

class Transactions {
  DateTime? createdOn;
  String? modifiedOn;
  String? type;
  double? addressTo;
  String? txId;
  double? confirmations;
  String? amount;
  bool? isVerified;
  bool? isCompleted;
  DateTime? time;
  String? currency;

  Transactions(
      {this.createdOn,
      this.modifiedOn,
      this.type,
      this.addressTo,
      this.txId,
      this.confirmations,
      this.amount,
      this.isVerified,
      this.isCompleted,
      this.time,
      this.currency});

  Transactions.fromJson(Map<String, dynamic> json) {
    createdOn = json['created_on'] == null
        ? null
        : DateTime.parse(json['created_on'] as String);

    modifiedOn = json['modified_on'];
    type = json['type'];
    addressTo = json['address_to'].toDouble();
    txId = json['tx_id'];
    confirmations = json['confirmations'].toDouble();
    amount = json['amount'];
    isVerified = json['is_verified'];
    isCompleted = json['is_completed'];
    time = json['time'] == null ? null : DateTime.parse(json['time'] as String);
    currency = json['currency'];
  }
}

class ReferralCode {
  String? code;
  String? createdOn;
  String? modifiedOn;

  ReferralCode({this.code, this.createdOn, this.modifiedOn});

  ReferralCode.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    createdOn = json['created_on'];
    modifiedOn = json['modified_on'];
  }
}

class Price {
  double? rate;
  double? rateUsd;
  double? rateBtc;
  double? rateEur;

  Price({this.rate, this.rateUsd, this.rateBtc, this.rateEur});

  Price.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    rateUsd = json['rate_usd'].toDouble();
    rateBtc = json['rate_btc'].toDouble();
    rateEur = json['rate_eur'].toDouble();
  }
}

import argparse
import os
import re


def convert_log_to_ip_dictionary(log_dir: str):
    ip_dictionary = {}
    file = open(log_dir, "r", encoding="utf-8")
    for checking_line in file.readlines():
        if checking_line.count("Unexpected packet received during login process!") == 0 and checking_line.count(
                "read timed out") == 0:
            continue

        ip = re.search(r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}', checking_line).group()

        if ip not in ip_dictionary:
            ip_dictionary[ip] = 0
        ip_dictionary[ip] += 1

    file.close()
    ip_dict = {k: v for k, v in sorted(ip_dictionary.items(), key=lambda item: item[1])}
    return ip_dict


def ip_dictionary_to_ip_list(ip_dictionary: dict, threshold: int):
    result = []
    for ip in ip_dictionary.keys():
        if ip_dictionary[ip] < threshold:
            continue
        result.append(ip)
    return result


def export_to_file(data: list, path: str):
    data = [line + "\n" for line in data]

    file = open(path, "w")
    file.writelines(data)
    file.close()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("-t", "--threshold", help="脅威判定されるエラーipの回数", default=50, type=int)
    parser.add_argument("-o", "--output", help="ipファイルの出力先", default="./iplist.txt", type=str)
    parser.add_argument("-l", "--log", help="latest.logのパス", default="./latest.log", type=str)

    arguments = parser.parse_args()

    if not os.path.exists(arguments.log):
        print("ファイルが存在しません")
        return

    if not os.path.isfile(arguments.log):
        print("ログファイルはファイルではありません")
        return

    result = convert_log_to_ip_dictionary(arguments.log)
    result = ip_dictionary_to_ip_list(result, arguments.threshold)
    export_to_file(result, arguments.output)
    print("出力が完了しました")


if __name__ == '__main__':
    main()

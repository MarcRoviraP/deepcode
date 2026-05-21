def solve():
    mayus = ""

    linea = input()

    for i in linea:
        if i.isupper():
            mayus += i

    print(mayus)

if __name__ == "__main__":
    solve()
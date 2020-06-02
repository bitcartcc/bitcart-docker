from constants import CRYPTO_COMPONENTS
from utils import env


def rule(services):
    if not services.get("nginx"):
        items = ["backend", "store", "admin"]
        items.extend(CRYPTO_COMPONENTS)
        for i in items:
            if services.get(i):
                expose = services[i].get("expose", []).copy()
                custom_port = env(f"{i.upper()}_PORT")
                for key, port in enumerate(expose):
                    expose[key] = f"{custom_port or port}:{port}"
                services[i]["ports"] = expose

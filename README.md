# switchbot-api-openapi

A project to write OpenAPI Schema from [Switchbot API documentation](https://github.com/OpenWonderLabs/SwitchBotAPI/blob/main/README.md).

Since OpenAPI Schema is not officially provided, This project provide an unofficial schema created from the documentation.

Some parts of the schema are written using LLM, so quality cannot be guaranteed. (Contributions are welcome.)

## Using OpenAPI Spec

You can download and use the OpenAPI Spec with the following command.

```bash
$ curl 'https://raw.githubusercontent.com/d-kimuson/switchbot-api-openapi/main/dist/%40typespec/openapi3/openapi.yaml?token=GHSAT0AAAAAACTGDF377DZU5X3WMTFBX6JQZUNNARQ' > ./switchbot-openapi.yaml
```

## Contribute

Most of source code is written out using LLM and is not accurate.
Contributions are welcome.

### Structure

Schemas are written by [TypeSpec](https://typespec.io/).

When you edit it, you need to modify the source code and build schema.

### setup repository

```bash
$ pnpm i
```

### start up development server

```bash
$ pnpm dev
```

The development watcher will be started.
You can preview the documentation at http://localhost:8080.

### build

```bash
$ pnpm build
```

## lint

Lint the OAS built by TypeSpec.

```bash $ pnpm build
$ pnpm lint
```
